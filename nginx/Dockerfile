FROM nginx:1.8.1

ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  fastcgi.conf    /etc/nginx/fastcgi.conf
ADD  sites-enabled/*    /etc/nginx/conf.d/
RUN  mkdir /opt/htdocs && mkdir /opt/log && mkdir /opt/log/nginx
RUN  chown -R www-data.www-data /opt/htdocs /opt/log

VOLUME ["/opt"]

# docker build -t firefly/nginx ./nginx
# docker run -p 80:80 -v ~/wwwroot:/opt/htdocs --link firefly/php:php7 -dit firefly/nginx

