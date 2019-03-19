# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "letsencrypt/map.jinja" import letsencrypt with context %}

letsencrypt-client:
  {% if letsencrypt.use_package %}
  pkg.installed:
    - pkgs: {{ letsencrypt.pkgs }}
  {% else %}
  pkg.installed:
    - name: git
  {% if letsencrypt.version is defined and letsencrypt.version|length %}
  git.cloned:
    - name: https://github.com/certbot/certbot
    - branch: {{ letsencrypt.version }}
    - target: {{ letsencrypt.cli_install_dir }}
  {% else %}
  git.latest:
    - name: https://github.com/certbot/certbot
    - target: {{ letsencrypt.cli_install_dir }}
    - force_reset: True
  {% endif %}
  {% endif %}
