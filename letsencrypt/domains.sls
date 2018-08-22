# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "letsencrypt/map.jinja" import letsencrypt with context %}

{% if letsencrypt.use_package %}
  # Renew checks if the cert exists and needs to be renewed
  {% set check_cert_cmd = '/usr/bin/certbot renew --dry-run --cert-name' %}
  {% set renew_cert_cmd = '/usr/bin/certbot renew' %}
  {% set old_check_cert_cmd_state = 'absent' %}
  {% set old_renew_cert_cmd_state = 'absent' %}
  {% set old_cron_state = 'absent' %}
  {% set create_cert_cmd = '/usr/bin/certbot' %}

{% else %}
  {% set check_cert_cmd = '/usr/local/bin/check_letsencrypt_cert.sh' %}
  {% set renew_cert_cmd = '/usr/local/bin/renew_letsencrypt_cert.sh' %}
  {% set old_check_cert_cmd_state = 'managed' %}
  {% set old_renew_cert_cmd_state = 'managed' %}
  {% set old_cron_state = 'present' %}
  {% set create_cert_cmd = letsencrypt.cli_install_dir ~ '/letsencrypt-auto' %}
{% endif %}

{{ check_cert_cmd }}:
  file.{{ old_check_cert_cmd_state }}:
    - mode: 755
    - contents: |
        #!/bin/bash

        FIRST_CERT=$1

        for DOMAIN in "$@"
        do
            openssl x509 -in /etc/letsencrypt/live/$1/cert.pem -noout -text | grep DNS:${DOMAIN} > /dev/null || exit 1
        done
        CERT=$(date -d "$(openssl x509 -in /etc/letsencrypt/live/$1/cert.pem -enddate -noout | cut -d'=' -f2)" "+%s")
        CURRENT=$(date "+%s")
        REMAINING=$((($CERT - $CURRENT) / 60 / 60 / 24))
        [ "$REMAINING" -gt "30" ] || exit 1
        echo Domains $@ are in cert and cert is valid for $REMAINING days

{{ renew_cert_cmd }}:
  file.{{ old_renew_cert_cmd_state }}:
    - template: jinja
    - source: salt://letsencrypt/files/renew_letsencrypt_cert.sh.jinja
    - mode: 755
    - require:
      - file: {{ check_cert_cmd }}

{% for setname, domainlist in letsencrypt.domainsets.items() %}

# domainlist[0] represents the "CommonName", and the rest
# represent SubjectAlternativeNames
create-initial-cert-{{ setname }}-{{ domainlist | join('+') }}:
  cmd.run:
    - unless: {{ check_cert_cmd }} {{ domainlist[0] }}
    - name: {{ create_cert_cmd }} --quiet -d {{ domainlist|join(' -d ') }} certonly --non-interactive
      {% if not letsencrypt.use_package %}
    - cwd: {{ letsencrypt.cli_install_dir }}
      {% endif %}
    - require:
      {% if letsencrypt.use_package %}
      - pkg: letsencrypt-client
      {% else %}
      - file: {{ check_cert_cmd }}
      {% endif %}
      - file: letsencrypt-config

letsencrypt-crontab-{{ setname }}-{{ domainlist[0] }}:
  cron.{{ old_cron_state }}:
    - name: {{ renew_cert_cmd }} {{ domainlist|join(' ') }}
    - month: '*'
    - minute: random
    - hour: random
    - dayweek: '*'
    - identifier: letsencrypt-{{ setname }}-{{ domainlist[0] }}
    - require:
      - cmd: create-initial-cert-{{ setname }}-{{ domainlist | join('+') }}
      {% if letsencrypt.use_package %}
      - pkg: letsencrypt-client
      {% else %}
      - file: {{ renew_cert_cmd }}
      {% endif %}

create-fullchain-privkey-pem-for-{{ domainlist[0] }}:
  cmd.run:
    - name: |
        cat /etc/letsencrypt/live/{{ domainlist[0] }}/fullchain.pem \
            /etc/letsencrypt/live/{{ domainlist[0] }}/privkey.pem \
            > /etc/letsencrypt/live/{{ domainlist[0] }}/fullchain-privkey.pem && \
        chmod 600 /etc/letsencrypt/live/{{ domainlist[0] }}/fullchain-privkey.pem
    - creates: /etc/letsencrypt/live/{{ domainlist[0] }}/fullchain-privkey.pem
    - require:
      - cmd: create-initial-cert-{{ setname }}-{{ domainlist | join('+') }}

{% endfor %}
