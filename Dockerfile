FROM calvintam236/ubuntu:amdgpu

LABEL maintainer="calvintam236"
LABEL description="XMRig-AMD in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl \
    && curl -L -O https://github.com/xmrig/xmrig-amd/releases/download/v2.8.1/xmrig-amd-2.8.1-xenial-amd64.tar.gz \
    && tar -xvf xmrig-amd-2.8.1-xenial-amd64.tar.gz \
    && rm xmrig-amd-2.8.1-xenial-amd64.tar.gz \
    && mv xmrig-amd-2.8.1/xmrig-amd /usr/local/bin/xmrig-amd \
    && chmod a+x /usr/local/bin/xmrig-amd \
    && rm -r xmrig-amd-2.8.1 \
    && apt-get -y remove curl \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["xmrig-amd"]
CMD ["-h"]
