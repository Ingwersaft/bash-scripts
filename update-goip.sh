#!/bin/bash
echo "start"
IPINFO="curl ipinfo.io/ip"
PUBLIC_IP=$(eval $IPINFO)
echo "found ip=${PUBLIC_IP}"
UPDATE_URL="curl 'https://www.goip.de/setip?username=WyqJ9qM7qQ8t6Cq&password=9dGXkjKadrglhR9&subdomain=mk7.goip.de&ip=${PUBLIC_IP}'"
echo "update url='${UPDATE_URL}'"
ANSWER=$(eval $UPDATE_URL)
echo "answer=$ANSWER"
