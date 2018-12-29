FROM gudari/java:8u191-b12

ARG ZOOKEEPER_VERSION=3.4.13
ENV ZOOKEEPER_HOME=/opt/zookeeper

RUN yum install -y wget && \
    wget https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
    mkdir -p ${ZOOKEEPER_HOME} && \
    tar xvf zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C ${ZOOKEEPER_HOME} --strip-components=1 && \
    rm -fr zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
    mkdir /opt/init

WORKDIR ${ZOOKEEPER_HOME}

COPY run/bootstrap.sh /opt/init/bootstrap.sh

CMD /opt/init/bootstrap.sh
