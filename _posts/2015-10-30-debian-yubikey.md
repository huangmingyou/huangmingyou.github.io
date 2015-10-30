---
layout: post
title: "debian yubikey"
description: ""
category: 
tags: []
---
{% include JB/setup %}

## debian challenge-response auth use yubikey

apt-get install yubikey-personalization libpam-yubico

# config yubikey
ykpersonalize -2 -ochal-resp -ochal-hmac -ohmac-lt64 -oserial-api-visible

# config pam for one user

ykpamcfg -2 -v

# enable in pam

dpkg-reconfigure libpam-yubico

set parameter to  
    mode=challenge-response

