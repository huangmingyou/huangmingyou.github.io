---
layout: post
title: "foreman puppet report"
description: ""
category: 
tags: []
---
{% include JB/setup %}

# foreman 安装的坑
 用apt-get 安装foreman以后，需用

	foreman-rake permissions:reset
	
命令重置密码，默认的changme密码并不能登录

# puppet report 的认证问题

先用 curl -u user:pass 测试，抓http请求头里面的'Authorization' 头，把抓到的头加到 foreman.rb 这个report脚本里面，增加一个http请求头来解决认证问题。
	

