FROM schemaspy/schemaspy:snapshot

ENV TZ Asia/Tokyo
ENV LANG C.UTF-8

USER root

# Install packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git diffutils openssh mysql-client

ADD sh /sh
ADD run.sh /run.sh

# Add ssh credential on build
ARG SSH_PRIVATE_KEY
RUN mkdir -p /root/.ssh/ && \
    echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa && \
    chmod -R 600 /root/.ssh/ && \
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts 

WORKDIR /

ENTRYPOINT [""]

