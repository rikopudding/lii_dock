FROM devilbox/php-fpm:7.2-prod

# COPY ./sources.list.stretch /etc/apt/sources.list

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
