---
layout: post
title: "linuxdesktop"
description: ""
category: 
tags: []
---
{% include JB/setup %}

## 终端字体
更改Debian控制台诡异的纤细字体：dpkg-reconfigure console-setup，调整相关设置

## ssl-cert
debian上对openssl的包装，方便做证书。

## iptables 模拟连续丢包
利用statistic模板的nth模式
比如没150个包连续丢5个包
>-A PREROUTING  -s 192.168.1.148 -p icmp -m statistic --mode nth --every 150 --packet 0 -j DROP 
>-A PREROUTING  -s 192.168.1.148 -p icmp -m statistic --mode nth --every 149 --packet 0 -j DROP 
>-A PREROUTING  -s 192.168.1.148 -p icmp -m statistic --mode nth --every 148 --packet 0 -j DROP 
>-A PREROUTING  -s 192.168.1.148 -p icmp -m statistic --mode nth --every 147 --packet 0 -j DROP 
>-A PREROUTING  -s 192.168.1.148 -p icmp -m statistic --mode nth --every 146 --packet 0 -j DROP 

##关于声卡和pci
update-pciids 更新最新的pci id list.
grep Codec /proc/asound/card0/codec#2  查看声卡型号
增加
>options snd-hda-intel model=generic 
到
>/etc/modprobe.d/alsa-base.conf
里面，解决新的intel hda声卡在debian6上不能用的问题。
