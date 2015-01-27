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
	
	Comment out all refuse-* command and require-mppe-128

	Edit /etc/pptpd.conf

	set the localip and remoteip

	Edit /etc/ppp/chap-secrets
	
	add username and password 

	username pptpd passwd *

	Restart pptpd
