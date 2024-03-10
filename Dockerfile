FROM karrelin/glibc-alpine
RUN mkdir -p /root/app/view/marketemo-vue/dist && \
sed -i 's#dl-cdn.alpinelinux.org#mirrors.aliyun.com#g' /etc/apk/repositories &&\
apk add bash busybox-extras tree && \
echo ". /etc/profile" > ~/.bashrc && \
ln -sf /bin/bash /bin/sh

WORKDIR /root/app
COPY ./bin/marketemo-mvc .
COPY ./application-build.yaml ./application.yaml
ADD ./view/marketemo-vue/dist /root/app/view/marketemo-vue/dist
#RUN #chmod +x  /root/app/marketemo
CMD /root/app/marketemo-mvc