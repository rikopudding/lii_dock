FROM devilbox/php-fpm:7.2-prod

# COPY ./sources.list.stretch /etc/apt/sources.list
RUN pecl install yaf-3.1.4; \
    docker-php-ext-enable yaf; \
    { \ 
		echo 'yaf.use_namespace=1'; \
		echo 'yaf.use_spl_autoload=1'; \
	} >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini; \
# RUN apt-get update && apt-get install -y \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libmcrypt-dev \
#         libpng-dev \
#         libssl-dev \
#     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#     && docker-php-ext-install -j$(nproc) gd \
#     && docker-php-ext-install pdo \
#     && docker-php-ext-install pdo_mysql \
#     && docker-php-ext-install mysqli \
#     && pecl install mongodb \
#     && pecl install redis \
#     && docker-php-ext-enable mongodb redis \
