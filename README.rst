===================
letsencrypt-formula
===================

Creates certificates and manages renewal using the letsencrypt service.

.. image:: https://travis-ci.org/saltstack-formulas/letsencrypt-formula.svg?branch=master

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``letsencrypt``
---------------

This is a shortcut for letsencrypt.install letsencrypt.config and letsencrypt.domains.

If `use_package` is `True` (the default), the formula will try to install the *certbot* package from your Distro's repo.
Keep in mind that most distros don't have a package available by default: Ie, current Debian (Stretch) requires a backports repo installed.
Centos 7 requires EPEL, etc. This formula **DOES NOT** manage these repositories. Use the `apt-formula <https://github.com/saltstack-formulas/apt-formula>`_
or the `epel-formula <https://github.com/saltstack-formulas/epel-formula`_ to manage them.

If `use_package` is `False` it installs and configures the letsencrypt cli from git, creates the requested certificates and installs renewal cron job.

** WARNING **
If you set `use_package` to `True`, it will:

* Default to Python3's certbot package (where possible), with Apache as the default Webserver to manage.
* Delete all certbot's crons if they exist from a previous git-based installation (as the package uses a
  systemd's timer unit to renew all the certs)
* Delete git-based installation's scripts (usually installed under /usr/local/bin) if they still exist declared in
  *letsencrypt*'s pillar.
* As a safety meassure, if there's an /opt/letsencrypt directory from a git-based installation, it will be left
  untouched, but unused.
To check dependencies to use the package for your distro, check https://certbot.eff.org/all-instructions.

``letsencrypt.install``
-----------------------

Only installs the letsencrypt client (see above).

``letsencrypt.config``
----------------------

Manages /etc/letsencrypt/cli.ini config file.

``letsencrypt.domains``
-----------------------

Creates a certificate with the domains in each domain set (letsencrypt:domainsets in pillar). Letsencrypt uses a relatively short validity of 90 days.
Therefore, a cron job for automatic renewal every 60 days is installed for each domain set as well.

