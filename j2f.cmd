@echo off
echo Please enter a fix version: 
set /p fixversion=""
cls
echo curl -o input.xml -u user@example.com:APIkey "Jira query with the % charcters escaped as %% and the fixversion entered as %fixversion%"
echo java -jar saxon.jar input.xml j2f.xsl > output.html
