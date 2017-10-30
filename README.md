# What is XMRig-AMD?

XMRig-AMD is the console miner provided by [XMRig](https://github.com/xmrig/xmrig-amd).

XMRig-AMD supports Cryptonight, and Cryptonight-lite.

# How to use this image [AMD version]

Run in background:

```console
$ docker run -d --device /dev/kfd --device /dev/dri --name YOUR_CONTAINER_NAME calvintam236/xmrig-amd:amd -a YOUR_ALGO -o YOUR_POOL_ADDRESS -u YOUR_USERNAME.YOUR_WORKER_NAME -p YOUR_WORKER_PASSWORD
```

Get `xmrig` options with:

```console
$ docker run --rm calvintam236/xmrig-amd:amd
```

Fetch logs of a container:

```console
$ docker logs YOUR_CONTAINER_NAME
```
