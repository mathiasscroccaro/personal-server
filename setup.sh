#!/bin/sh

mkdir nginx/conf

docker run --name tmp-nginx -d nginx:alpine
docker cp tmp-nginx:/etc/nginx/ nginx/conf
docker rm -f tmp-nginx
mv nginx/conf/nginx/* nginx/conf
rm -r nginx/conf/nginx
mkdir nginx/conf/sites-available
mkdir nginx/conf/sites-enabled
sed 's/include \/etc\/nginx\/conf.d\/\*.conf;/include \/etc\/nginx\/sites-enabled\/*;/g' nginx/conf/nginx.conf
