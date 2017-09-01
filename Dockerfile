FROM registry.cn-hangzhou.aliyuncs.com/firefly/nginx-php:v1.0

ADD dockerd  /etc/init.d/
RUN chmod 755 /etc/init.d/dockerd

CMD ["/bin/bash"]
