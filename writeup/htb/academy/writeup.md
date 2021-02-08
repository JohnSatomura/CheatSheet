# How to solve

## scan on nmap 
sudo nmap -sC -sV -sT  10.10.10.215 

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)   
| ssh-hostkey:   
|   3072 c0:90:a3:d8:35:25:6f:fa:33:06:cf:80:13:a0:a5:53 (RSA)  
|   256 2a:d5:4b:d0:46:f0:ed:c9:3c:8d:f6:5d:ab:ae:77:96 (ECDSA)  
|_  256 e1:64:14:c3:cc:51:b2:3b:a6:28:a7:b1:ae:5f:45:35 (ED25519)  
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))  
|_http-server-header: Apache/2.4.41 (Ubuntu)  
|_http-title: Did not follow redirect to http://academy.htb/  
2030/tcp  filtered device2  
32773/tcp filtered sometimes-rpc9  

wfuzz -u http://academy.htb/FUZZ.php -w /usr/share/Wordlist/http-scan.txt --hc 404,403 -t 100

 /usr/lib/python3/dist-packages/wfuzz/__init__.py:34: UserWarning:Pycurl is not compiled against Openssl. Wfuzz might not work correctly when fuzzing SSL sites. Check Wfuzz's documentation for more information.
 /usr/lib/python3/dist-packages/wfuzz/wfuzz.py:78: UserWarning:Fatal exception: Error opening file. [Errno 2] No such file or directory: '/usr/share/Wordlist/http-scan.txt'

