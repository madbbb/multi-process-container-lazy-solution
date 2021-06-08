#!/usr/bin/env bash
set -e

nginx -c "$PWD/nginx.conf" &

cd /src/backend
npm start &

cd /src/frontend
./node_modules/.bin/next -p 8081 &

wait -n
