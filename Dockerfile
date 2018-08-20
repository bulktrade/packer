FROM hashicorp/packer:full

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        jq \
        git \
        mailcap \
        && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
    
VOLUME /root/.aws
