#! /bin/bash

# use squid proxy
# if you comment out the below lines, you cannot access nginx
export http_proxy=http://localhost:3128
export https_proxy=http://localhost:3128
export HTTP_PROXY=http://localhost:3128
export HTTPS_PROXY=http://localhost:3128

curl http://nginx:80
