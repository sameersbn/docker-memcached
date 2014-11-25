# Table of Contents

- [Introduction](#introduction)
- [Contributing](#contributing)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Shell Access](#shell-access)
- [Upgrading](#upgrading)

# Introduction

Dockerfile to build a memcached container image which can be linked to other containers.

# Contributing

If you find this image useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with [Issues](https://github.com/sameersbn/docker-memcached/issues) they may encounter
- Send me a tip via [Bitcoin](https://www.coinbase.com/sameersbn) or using [Gratipay](https://gratipay.com/sameersbn/)

# Installation

Pull the latest version of the image from the docker index. This is the recommended method of installation as it is easier to update image in the future. These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull sameersbn/memcached:latest
```

Alternately you can build the image yourself.

```bash
git clone https://github.com/sameersbn/docker-memcached.git
cd docker-memcached
docker build -t="$USER/memcached" .
```

# Quick Start

Run the memcached image

```bash
docker run --name='memcached' -it --rm sameersbn/memcached:latest
```

The default cache size (*maximum memory*) is `64` MB. You can set it to whatever you like using the `CACHE_SIZE` configuration option. For example, if I wanted to set the cache size to `256` MB:

```bash
docker run --name='memcached' -it --rm \
-e 'CACHE_SIZE=256' sameersbn/memcached:latest
```

Additionally you can also supply additional command line switches to the memcached command using the `EXTRA_OPTS` configuration option. For example, if I wanted to `2` threads and be extra verbose:

```bash
docker run --name='memcached' -it --rm \
-e 'EXTRA_OPTS=-t 2 -vv' sameersbn/memcached:latest
```

Please refer to http://linux.die.net/man/1/memcached for complete list of available memcached configuration options.

# Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using docker version `1.3.0` or higher you can access a running containers shell using `docker exec` command.

```bash
docker exec -it memcached bash
```

If you are using an older version of docker, you can use the [nsenter](http://man7.org/linux/man-pages/man1/nsenter.1.html) linux tool (part of the util-linux package) to access the container shell.

Some linux distros (e.g. ubuntu) use older versions of the util-linux which do not include the `nsenter` tool. To get around this @jpetazzo has created a nice docker image that allows you to install the `nsenter` utility and a helper script named `docker-enter` on these distros.

To install `nsenter` execute the following command on your host,

```bash
docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter
```

Now you can access the container shell using the command

```bash
sudo docker-enter memcached
```

For more information refer https://github.com/jpetazzo/nsenter

# Upgrading

To upgrade to newer releases, simply follow this 3 step upgrade procedure.

- **Step 1**: Stop the currently running image

```bash
docker stop memcached
```

- **Step 2**: Update the docker image.

```bash
docker pull sameersbn/memcached:latest
```

- **Step 3**: Start the image

```bash
docker run --name='memcached' -d [OPTIONS] sameersbn/memcached:latest
```
