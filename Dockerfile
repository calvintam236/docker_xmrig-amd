FROM calvintam236/ubuntu:amd

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="XMRig-AMD in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl build-essential cmake libuv1-dev ocl-icd-opencl-dev \
    #&& git clone https://github.com/xmrig/xmrig-amd.git \
    && curl -L -O https://github.com/xmrig/xmrig-amd/archive/v2.4.5.tar.gz \
    && tar -xvf v2.4.5.tar.gz \
    && rm v2.4.5.tar.gz \
    && cd xmrig-amd-2.4.5 \
    && mkdir build \
    && cd build \
    && cmake .. -DWITH_HTTPD=OFF \
    && make \
    && cd ../.. \
    && mv xmrig-amd-2.4.5/build/xmrig-amd /usr/local/bin/xmrig-amd \
    && chmod a+x /usr/local/bin/xmrig-amd \
    && rm -r xmrig-amd-2.4.5 \
    && apt-get -y remove ca-certificates curl build-essential cmake libuv1-dev ocl-icd-opencl-dev \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["xmrig-amd"]
CMD ["-h"]
