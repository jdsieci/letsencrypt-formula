
Changelog
=========

`2.1.0 <https://github.com/saltstack-formulas/letsencrypt-formula/compare/v2.0.0...v2.1.0>`_ (2020-10-26)
-------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **pre-commit:** add to formula [skip ci] (\ `0ca8d4f <https://github.com/saltstack-formulas/letsencrypt-formula/commit/0ca8d4f92f721161a2b0de15e882fbf144e1f017>`_\ )
* **pre-commit:** enable/disable ``rstcheck`` as relevant [skip ci] (\ `87e6d43 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/87e6d43da34943ae5435615939417b2c251394a9>`_\ )
* **pre-commit:** finalise ``rstcheck`` configuration [skip ci] (\ `30492a3 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/30492a36a285baa428b7a3e894246998a5dce8c2>`_\ )

Features
^^^^^^^^


* **map:** add ``create_init_cert_subcmd`` var (\ `20f9b35 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/20f9b35fda19a7bad7335283fc566836a7631ab1>`_\ )

`2.0.0 <https://github.com/saltstack-formulas/letsencrypt-formula/compare/v1.1.0...v2.0.0>`_ (2020-08-26)
-------------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* use domains' setname as --cert-name option (\ `68fb247 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/68fb2475508fea71caf542f62be0e5ce3789e90e>`_\ )

BREAKING CHANGES
^^^^^^^^^^^^^^^^


* Since this domains' setname was not used, the path was named
  after the first domain in the domains set. In order to keep using this workflow,
  you need to rename the setname with the first domain in the list like the
  following:
  .. code-block::

     letsencrypt:
     domains:
       foo.example.com:
         - foo.example.com

`1.1.0 <https://github.com/saltstack-formulas/letsencrypt-formula/compare/v1.0.0...v1.1.0>`_ (2020-07-29)
-------------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **map:** add FreeBSD support for certbot (\ `911a443 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/911a443070d601f30a0b43e6dc258fd00a7d70cb>`_\ )

`1.0.0 <https://github.com/saltstack-formulas/letsencrypt-formula/compare/v0.20.2...v1.0.0>`_ (2020-07-23)
--------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **package:** amazonlinux defaults to python2 (\ `926c779 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/926c779d477e86ee99eeb435a7bca66b023cf594>`_\ )
* **server:** change server to ACMEv2 (\ `1fc79b8 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/1fc79b858364d08621dcd2b606e6adf440d0d9f8>`_\ ), closes `#72 <https://github.com/saltstack-formulas/letsencrypt-formula/issues/72>`_

Documentation
^^^^^^^^^^^^^


* **defaults:** update pillar.example to good-citizen defaults (\ `b889678 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/b889678880d89ca629e13551fbd31a5b447b8e16>`_\ )

Features
^^^^^^^^


* **config:** add sane defaults (\ `d9afac9 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/d9afac941c17f57b97ca50e70cf78a21e60c39c5>`_\ )
* **package:** update default to py3 (\ `4c93c11 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/4c93c119d2fd596bfd032598f8f4883ec999b748>`_\ )

BREAKING CHANGES
^^^^^^^^^^^^^^^^


* **config:** ``config`` can now be provided as a hash or a string; defaults
  are modified and, while sane and desirable, do change the behavior of the
  formula.

`0.20.2 <https://github.com/saltstack-formulas/letsencrypt-formula/compare/v0.20.1...v0.20.2>`_ (2020-07-07)
----------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **domains:** renew --no-random-sleep-on-renew (\ `07cbc3b <https://github.com/saltstack-formulas/letsencrypt-formula/commit/07cbc3bf8877bbca9da067e9208ac7c05d651b00>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** use ``saltimages`` Docker Hub where available [skip ci] (\ `be61a98 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/be61a987832218a3b0036c33fec6ccab343b0d86>`_\ )

`0.20.1 <https://github.com/saltstack-formulas/letsencrypt-formula/compare/v0.20.0...v0.20.1>`_ (2020-06-11)
----------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **install:** reload after install, to enable salt.modules.acme (\ `8682b80 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/8682b80593a23454a91919cae9c716ce56e4097f>`_\ )
* **release.config.js:** use full commit hash in commit link [skip ci] (\ `d9b4559 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/d9b45596c629b398be89b4b63cd1af6f6b08404c>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile:** restrict ``train`` gem version until upstream fix [skip ci] (\ `a965594 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/a965594ec9f59ef9caed0a483ed7d40395fb7b5a>`_\ )
* **gemfile.lock:** add to repo with updated ``Gemfile`` [skip ci] (\ `be11444 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/be114445aad0db88f0c54dd58fac39d2fafc72fa>`_\ )
* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `05afe35 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/05afe358e12e828ba1a16c833933238272ff32d0>`_\ )
* **kitchen:** use ``develop`` image until ``master`` is ready (\ ``amazonlinux``\ ) [skip ci] (\ `c92511b <https://github.com/saltstack-formulas/letsencrypt-formula/commit/c92511b105b8a3f7c27f79b98d60d562923ee2dd>`_\ )
* **kitchen+travis:** remove ``master-py2-arch-base-latest`` [skip ci] (\ `fd89ecb <https://github.com/saltstack-formulas/letsencrypt-formula/commit/fd89ecb28cd4a825c5a7e9d81edbf56b98d6d22f>`_\ )
* **kitchen+travis:** upgrade matrix after ``2019.2.2`` release [skip ci] (\ `60f1a39 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/60f1a39c56477b1b40ad3b113a297cad03068fc2>`_\ )
* **travis:** add notifications => zulip [skip ci] (\ `c422541 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/c422541e4c7f0f4d2859e80ff2fcb94234ee3ac8>`_\ )
* **travis:** apply changes from build config validation [skip ci] (\ `a786c41 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/a786c417e14059ccf228518ff6fa22dc91c145e4>`_\ )
* **travis:** opt-in to ``dpl v2`` to complete build config validation [skip ci] (\ `42643b5 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/42643b52271600d4b270e16f2de8e53bb6f3a9f4>`_\ )
* **workflows/commitlint:** add to repo [skip ci] (\ `bb62011 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/bb62011bea7553976f7c09049e4946610dc072dd>`_\ )
* workaround issues with newly introduced ``amazonlinux-1`` [skip ci] (\ `380f8d6 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/380f8d633a197122162442228094d167989c4800>`_\ )
* **travis:** quote pathspecs used with ``git ls-files`` [skip ci] (\ `443e539 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/443e539fc1f0eda9e3705dd6eef784088e49bc7e>`_\ )
* **travis:** run ``shellcheck`` during lint job [skip ci] (\ `e3613df <https://github.com/saltstack-formulas/letsencrypt-formula/commit/e3613df1430959129920c04bdafcdec04f927309>`_\ )
* **travis:** use ``major.minor`` for ``semantic-release`` version [skip ci] (\ `bc5c44c <https://github.com/saltstack-formulas/letsencrypt-formula/commit/bc5c44cfbef9287766e3ac2f5cd07a0ac8da8388>`_\ )
* **travis:** use build config validation (beta) [skip ci] (\ `3dc8c72 <https://github.com/saltstack-formulas/letsencrypt-formula/commit/3dc8c72c7287301682ccd35d2cb23b91418ead21>`_\ )

Performance Improvements
^^^^^^^^^^^^^^^^^^^^^^^^


* **travis:** improve ``salt-lint`` invocation [skip ci] (\ `85af6ca <https://github.com/saltstack-formulas/letsencrypt-formula/commit/85af6ca4a9555635ce338851014f0dd6719b0482>`_\ )

`0.20.0 <https://github.com/saltstack-formulas/letsencrypt-formula/compare/v0.19.1...v0.20.0>`_ (2019-10-24)
----------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **map.jinja:** fix ``salt-lint`` errors (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/55b3b31>`_\ )
* **repo:** provide EPEL repo configuration for ``amazon-2`` (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/25196c8>`_\ )
* **rubocop:** add fixes using ``rubocop --safe-auto-correct`` (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/94e8abe>`_\ )
* **rubocop:** fix remaining errors manually (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/f313483>`_\ )
* **yamllint:** fix all errors (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/9aaec41>`_\ )

Code Refactoring
^^^^^^^^^^^^^^^^


* **kitchen:** prefer ``kitchen.yml`` to ``.kitchen.yml`` (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/950b95d>`_\ )
* **kitchen:** use ``pillar_from_files`` throughout (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/65ee41d>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** remove redundant settings (all covered under the suites) (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/37a3a56>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** modify according to standard structure (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/fcaa79c>`_\ )
* **readme:** move to ``docs/`` directory (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/550b56d>`_\ )

Features
^^^^^^^^


* **semantic-release:** implement for this formula (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/1a6c486>`_\ )

Tests
^^^^^


* **inspec:** fix typo in ``git`` test filename (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/83f1cac>`_\ )
* **inspec:** move tests to relevant ``controls`` sub-directory (\ ` <https://github.com/saltstack-formulas/letsencrypt-formula/commit/71bd8c1>`_\ )
