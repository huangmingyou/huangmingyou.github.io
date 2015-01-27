---
layout: post
title: "setup l2tp/ipsec server on ubuntu"
description: ""
category: 
tags: []
---
{% include JB/setup %}


# setup a l2tp/ipsec server on ubuntu


Install software
	apt-get install openswan xl2tpd

Edit  /etc/xl2tpd/xl2tpd.conf with this content
	
	[global]
	ipsec saref = no

	[lns default]
	ip range = 10.10.0.30-10.10.0.40
	local ip = 10.10.0.1
	refuse pap = yes
	require authentication = yes
	ppp debug = yes
	pppoptfile = /etc/ppp/options.xl2tpd
	length bit = yes

Edit /etc/ppp/options.xl2tpd with this content

	require-mschap-v2
	ms-dns 8.8.8.8
	ms-dns 8.8.4.4
	auth
	mtu 1200
	mru 1000
	crtscts
	hide-password
	modem
	name l2tpd
	proxyarp
	lcp-echo-interval 30
	lcp-echo-failure 4


Edit /etc/ppp/chap-secrets  with this content

	user l2tpd pass *


Edit /etc/ipsec.secrets with this content

	YOUIP %any:   PSK "youpass"


Edit /etc/ipsec.conf with this contnet

	config setup
		dumpdir=/var/run/pluto/
		nat_traversal=yes
    		virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v6:fd00::/8,%v6:fe80::/10
    		protostack=netkey

	conn L2TP-PSK-NAT
    		rightsubnet=vhost:%priv
    		also=L2TP-PSK-noNAT

	conn L2TP-PSK-noNAT
    		authby=secret
    		pfs=no
    		auto=add
    		keyingtries=3
    		ikelifetime=8h
    		keylife=1h
    		type=transport
    		left=YOU IP
    		leftprotoport=17/1701
    		right=%any
    		rightprotoport=17/%any


	


