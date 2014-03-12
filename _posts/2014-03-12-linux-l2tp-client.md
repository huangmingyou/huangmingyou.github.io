---
layout: post
title: "linux l2tp client"
description: ""
category: 
tags: []
---
{% include JB/setup %}
## install xl2tpd
	apt-get install xl2tpd
## edit xl2tpd.conf
	[lac test]
	lns = ip
	ppp debug = yes
	pppoptfile = /etc/ppp/options.l2tpd.client
	length bit = yes


## edit /etc/ppp/options.l2tpd.client

	ipcp-accept-local
	ipcp-accept-remote
	refuse-eap
	require-mschap-v2
	noccp
	noauth
	idle 1800
	mtu 1410
	mru 1410
	defaultroute
	replacedefaultroute
	usepeerdns
	debug
	lock
	connect-delay 5000
	name my_user
	password my_pass

## restart xl2tpd
	/etc/init.d/xl2tpd restart
## connect

	echo 'c test ' > /var/run/xl2tpd/l2tp-control

## disconnect

	echo "d test" > /var/run/xl2tpd/l2tp-control
