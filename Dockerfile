FROM alpine:latest

RUN apk add --no-cache python3 py3-pip

RUN apk add openjdk11

RUN apk add --update curl unzip

WORKDIR /opt
RUN curl -L -O "https://downloads.datomic.com/builds/datomic-presto-server/datomic-presto-server-96.zip"
RUN unzip -q datomic-presto-server-96.zip
RUN rm -rf datomic-presto-server-96.zip

COPY etc /opt/presto-server/etc
RUN chmod +x /opt/presto-server/bin/launcher*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]