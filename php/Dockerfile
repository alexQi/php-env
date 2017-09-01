FROM registry.cn-hangzhou.aliyuncs.com/firefly/base:v1.0

# 复制文件
COPY ext/* /home/src/
ADD  php.ini /home/etc/php.ini
ADD  php-fpm.conf /home/etc/php-fpm.conf
ADD  www.conf /home/etc/php-fpm.d/www.conf

# 系统更新
RUN \
    apt-get update \
    && apt-get upgrade \
    && apt-get install -y apt-utils \
    && apt-get install -y libxml2-dev build-essential \
    && apt-get install -y openssl libssl-dev \
    && apt-get install -y make curl autoconf \
    && apt-get install -y libcurl4-gnutls-dev \
    && apt-get install -y libjpeg-dev libpng-dev \
    && apt-get install -y libreadline6 libreadline6-dev \
    && apt-get install -y libcurl4-openssl-dev pkg-config \
    && apt-get install -y libfreetype6-dev libxslt1-dev \
    && ln -s /usr/lib/x86_64-linux-gnu/libssl.so  /usr/lib \
    && cd /home/src \
    && tar zvxf openssl-1.1.0e.tar.gz \
    && cd openssl-1.1.0e \
    && ./config --prefix=/usr/local/openssl \
    && ./config -t \
    && make && make install \
    && cd .. \
    && tar zvxf libiconv-1.13.tar.gz \
    && cd libiconv-1.13 \
    && ./configure --prefix=/usr/local \
    && make && make install \
    && ln -s /usr/local/lib/libiconv.la /usr/lib/libiconv.la \
    && ln -s /usr/local/lib/libiconv.so /usr/lib/libiconv.so \
    && ln -s /usr/local/lib/libiconv.so.2 /usr/lib/libiconv.so.2 \
    && ln -s /usr/local/lib/libiconv.so.2.5.0 /usr/lib/libiconv.so.2.5.0 \
    && cd .. \
    && tar zvxf php-7.1.4.tar.gz \
    && cd php-7.1.4 \
    && ./configure --prefix=/usr/local/php --with-curl --with-freetype-dir --with-gd --with-gettext --with-iconv-dir --with-kerberos --with-libdir=lib64 --with-libxml-dir --with-mysqli --with-openssl --with-pcre-regex --with-pdo-mysql --with-pdo-sqlite --with-pear --with-png-dir --with-xmlrpc --with-xsl --with-zlib --enable-fpm --enable-bcmath --enable-libxml --enable-inline-optimization --enable-gd-native-ttf --enable-mbregex --enable-mbstring --enable-opcache --enable-pcntl --enable-shmop --enable-soap --enable-sockets --enable-sysvsem --enable-xml --enable-zip \
    && make ZEND_EXTRA_LIBS='-liconv' \
    && make install \
    && echo 'export PATH=/usr/local/php/bin:$PATH'>>/etc/profile \
    && . /etc/profile \
    && cp /home/src/php-7.1.4/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm \
    && chmod 755 /etc/init.d/php-fpm \
    && mv /home/etc/php.ini /usr/local/php/lib/php.ini \
    && mv /home/etc/php-fpm.conf /usr/local/php/etc/php-fpm.conf \
    && mv /home/etc/php-fpm.d/www.conf /usr/local/php/etc/php-fpm.d/www.conf \
    && groupadd www && useradd -g www www \
    && cd .. \
    && tar zvxf redis-3.1.1.tgz \
    && cd redis-3.1.1 \
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
#    && echo "extension=redis.so">>/usr/local/php/lib/php.ini \
    && cd .. \
    && tar zvxf swoole-1.9.5.tgz \
    && cd swoole-1.9.5 \
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
#    && echo "extension=swoole.so">>/usr/local/php/lib/php.ini \
    && cd .. \
    && tar zvxf mongodb-1.1.9.tgz \
    && cd mongodb-1.1.9 \
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
    && cd .. \
    && tar zvxf xdebug-2.5.3.tgz \
    && cd xdebug-2.5.3 \
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
#    && echo "zend_extension=xdebug.so">>/usr/local/php/lib/php.ini \
VOLUME ['/opt/htdocs']
EXPOSE 9000

