# Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Upgrading](#upgrading)

# Introduction

Dockerfile to build a memcached container image which can be linked to other containers.

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
