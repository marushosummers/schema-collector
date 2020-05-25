FROM schemaspy/schemaspy:snapshot

ENV TZ Asia/Tokyo
ENV LANG C.UTF-8

USER root

# Install packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache git openssh mysql-client

ADD run_schemaspy.sh /run_schemaspy
ADD upload_repository.sh /upload_repository

# Add ssh credential on build
ARG SSH_PRIVATE_KEY
RUN mkdir -p /root/.ssh/ && \
    echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa && \
    chmod -R 600 /root/.ssh/ && \
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts 

WORKDIR /

ENTRYPOINT [""]

