FROM calvintam236/ubuntu:amd

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="XMRig-AMD in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates git build-essential cmake libuv1-dev ocl-icd-opencl-dev \
    && git clone https://github.com/xmrig/xmrig-amd.git \
    && cd xmrig-amd \
    && mkdir build \
    && cd build \
    && cmake .. -DWITH_HTTPD=OFF \
    && make \
    && cd ../.. \
    && mv xmrig-amd/build/xmrig-amd /usr/local/bin/xmrig-amd \
    && chmod a+x /usr/local/bin/xmrig-amd \
    && rm -r xmrig-amd \
    && apt-get -y remove ca-certificates git build-essential cmake libuv1-dev ocl-icd-opencl-dev \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["xmrig-amd"]
CMD ["-h"]
