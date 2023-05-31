FROM rikopudding/nginx




USER root
# COPY ./issue-dnspod.sh /usr/local/bin

ARG DOCKER_UID
ARG ACME_EMAIL
RUN set -eux; docker-change-uid $DOCKER_UID;\
    apk add git; \
    git clone https://github.com/acmesh-official/acme.sh.git /root/acme.sh ; \
    cd /root/acme.sh; \
    ./acme.sh --install  \
    # --config-home /root/acme_data \
    --cert-home  /root/acme_cert \
    --accountemail  $ACME_EMAIL; \
    echo alias acme.sh="~/.acme.sh/acme.sh" > /etc/profile.d/acme.sh



EXPOSE 80 443 5080
