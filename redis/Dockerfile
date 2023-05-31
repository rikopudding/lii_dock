FROM rikopudding/redis


ARG REDIS_PWD
RUN sed -i "s/# requirepass foobared/requirepass ${REDIS_PWD}/" /usr/local/etc/redis/redis.conf