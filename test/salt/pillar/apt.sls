# -*- coding: utf-8 -*-
# vim: ft=yaml
---
apt:
  repositories:
    letsencrypt-backports:
      distro: stretch-backports
      url: http://deb.debian.org/debian
      comps: [main]
  preferences:
    letsencrypt-backports:
      pin: release a=stretch-backports
      priority: 640
