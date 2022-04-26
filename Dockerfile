FROM centos:centos8

RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
RUN sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*

RUN yum update -y \
    && yum install -y --enablerepo=powertools\
      gcc \
      gcc-c++ \
      git \
      make \
      cmake \
      openssl-devel \
      boost-devel \
      snappy-devel \
    && yum clean all

COPY . /opt/RiakToolsCxx

RUN cd /opt/RiakToolsCxx \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make

WORKDIR /opt/RiakToolsCxx

ENTRYPOINT ["/opt/RiakToolsCxx/build/src/riakcompact"]
