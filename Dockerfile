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
    
ENV TERRAFORM_VERSION=0.11.7    
    
RUN apk update && \
    apk add bash ca-certificates git openssl unzip wget && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
    
RUN git clone https://github.com/kamatama41/tfenv.git ~/.tfenv && \
    ln -s ~/.tfenv/bin/* /usr/bin
    
VOLUME /root/.aws
