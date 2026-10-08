#!/bin/sh
cd /tmp
for i in 1 2 3 4 5; do
  wgcf register --accept-tos && wgcf generate && break
  sleep 5
done

cp /tmp/wgcf-profile.conf /tmp/wireproxy.conf
printf '\n[Socks5]\nBindAddress = 127.0.0.1:1080\n' >> /tmp/wireproxy.conf
wireproxy -c /tmp/wireproxy.conf &

cd /app
exec /usr/local/bin/python -u /app/flaresolverr.py
