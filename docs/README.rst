.. _readme:

letsencrypt-formula
===================

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/letsencrypt-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/letsencrypt-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Creates certificates and manages renewal using the letsencrypt service.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

If you need (non-default) configuration, please pay attention to the ``pillar.example`` file and/or `Special notes`_ section.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Special notes
-------------

None

Available states
----------------

.. contents::
   :local:

``letsencrypt``
^^^^^^^^^^^^^^^

This is a shortcut for letsencrypt.install letsencrypt.config and letsencrypt.domains.

If `use_package` is `True` (the default), the formula will try to install the *certbot* package from your Distro's repo.
Keep in mind that most distros don't have a package available by default: Ie, current Debian (Stretch) requires a backports repo installed.
Centos 7 requires EPEL, etc. This formula **DOES NOT** manage these repositories. Use the `apt-formula <https://github.com/saltstack-formulas/apt-formula>`_
or the `epel-formula <https://github.com/saltstack-formulas/epel-formula>`_ to manage them.

If `use_package` is `False` it installs and configures the letsencrypt cli from git, creates the requested certificates and installs renewal cron job.

** WARNING **
If you set `use_package` to `True`, it will:

* Default to Python3's certbot package (where possible), with Apache as the default Webserver to manage.
* Delete all certbot's crons if they exist from a previous git-based installation (as the package uses a
  systemd's timer unit to renew all the certs)
* Delete git-based installation's scripts (usually installed under /usr/local/bin) if they still exist declared in
  *letsencrypt*'s pillar.
* As a safety measure, if there's an /opt/letsencrypt directory from a git-based installation, it will be left
  untouched, but unused.
To check dependencies to use the package for your distro, check https://certbot.eff.org/all-instructions.

``letsencrypt.install``
^^^^^^^^^^^^^^^^^^^^^^^

Only installs the letsencrypt client (see above).

``letsencrypt.config``
^^^^^^^^^^^^^^^^^^^^^^

Manages /etc/letsencrypt/cli.ini config file.

``letsencrypt.domains``
^^^^^^^^^^^^^^^^^^^^^^^

Creates a certificate with the domains in each domain set (letsencrypt:domainsets in pillar). Letsencrypt uses a relatively short validity of 90 days.
Therefore, a cron job for automatic renewal every 60 days is installed for each domain set as well.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``template`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.
