---
layout: post
title: "pptp server for iphone"
description: ""
category: 
tags: []
---
{% include JB/setup %}
# setup a pptp server on ubuntu for iphone

	apt-get install pptpd

Edit /etc/ppp/pptpd-options
	
	name pptpd
	ms-dns 8.8.8.8
	proxyarp
	nodefaultroute
	lock
	nobsdcomp 


Edit /etc/pptpd.conf

	set the localip and remoteip

Edit /etc/ppp/chap-secrets,add username and password 

	username pptpd passwd *

Restart pptpd
