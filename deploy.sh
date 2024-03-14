#!/bin/bash
cd ./view/marketemo-vue/
npm run build
cd ../../
docker build -t swr.cn-north-4.myhuaweicloud.com/wenxl/marketemo-mvc:v1 . -f Dockerfile
docker push swr.cn-north-4.myhuaweicloud.com/wenxl/marketemo-mvc:v1
docker-compose stop marketemo
docker-compose rm -f marketemo
docker-compose start marketemo
