#!/bin/bash

# Import our environment variables from systemd
for e in $(tr "\000" "\n" < /proc/1/environ); do
        eval "export $e"
done

function log() {
    echo $1 >> /get.log
}
while true ; do
  if netstat -anlpt | grep "0.0.0.0:80" | grep LISTEN; then
      log "break"
      break
  else
    log "sleep 1"
    sleep 1
  fi
done

if [ "$ENV" == "test" ]; then
  log "start to get ssl using test acme"
  /usr/bin/certbot --config /certbot-nginx.ini --server https://acme-staging-v02.api.letsencrypt.org/directory
else
  log "start to get ssl using prod acme"
  /usr/bin/certbot --config /certbot-nginx.ini
fi