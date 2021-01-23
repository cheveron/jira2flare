#!/bin/bash
echo -n "Please enter a fix version: "
read fixversion
curl -o input.xml -u user@example.com:APIkey "Jira query with the fixversion entered as $fixversion"
saxon input.xml j2f.xsl > output.html
