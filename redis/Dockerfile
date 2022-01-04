FROM redis:alpine

## For security settings uncomment, make the dir, copy conf, and also start with the conf, to use it
RUN mkdir -p /usr/local/etc/redis
COPY redis.conf /usr/local/etc/redis/redis.conf
ARG REDIS_PWD
RUN sed -i "s/# requirepass foobared/requirepass ${REDIS_PWD}/" /usr/local/etc/redis/redis.conf


EXPOSE 6379

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
#CMD ["redis-server"]
