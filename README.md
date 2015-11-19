[![Circle CI](https://circleci.com/gh/sameersbn/docker-memcached.svg?style=shield)](https://circleci.com/gh/sameersbn/docker-memcached) [![Docker Repository on Quay.io](https://quay.io/repository/sameersbn/memcached/status "Docker Repository on Quay.io")](https://quay.io/repository/sameersbn/memcached)

# sameersbn/memcached:latest

- [Introduction](#introduction)
  - [Contributing](#contributing)
  - [Issues](#issues)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
  - [Command-line arguments](#command-line-arguments)
- [Maintenance](#maintenance)
  - [Upgrading](#upgrading)
  - [Shell Access](#shell-access)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Memcached](http://memcached.org/).

Memcached is a free & open source, high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load.

## Contributing

If you find this image useful here's how you can help:

- Send a pull request with your awesome features and bug fixes
- Help users resolve their [issues](../../issues?q=is%3Aopen+is%3Aissue).
- Support the development of this image with a [donation](http://www.damagehead.com/donate/)

## Issues

Before reporting your issue please try updating Docker to the latest version and check if it resolves the issue. Refer to the Docker [installation guide](https://docs.docker.com/installation) for instructions.

SELinux users should try disabling SELinux using the command `setenforce 0` to see if it resolves the issue.

If the above recommendations do not help then [report your issue](../../issues/new) along with the following information:

- Output of the `docker version` and `docker info` commands
- The `docker run` command or `docker-compose.yml` used to start the image. Mask out the sensitive bits.
- Please state if you are using [Boot2Docker](http://www.boot2docker.io), [VirtualBox](https://www.virtualbox.org), etc.

# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/sameersbn/memcached) and is the recommended method of installation.

> **Note**: Builds are also available on [Quay.io](https://quay.io/repository/sameersbn/memcached)

```bash
docker pull sameersbn/memcached:latest
```

Alternatively you can build the image yourself.

```bash
docker build -t sameersbn/memcached github.com/sameersbn/docker-memcached
```

## Quickstart

Start Memcached using:

```bash
docker run --name memcached -d --restart=always \
  --publish 11211:11211 \
  sameersbn/memcached:latest
```

*Alternatively, you can use the sample [docker-compose.yml](docker-compose.yml) file to start the container using [Docker Compose](https://docs.docker.com/compose/)*

## Command-line arguments

You can customize the launch command of Memcached server by specifying arguments to `memcached` on the `docker run` command. For example the following command prints the help menu of `memcached` command:

```bash
docker run --name memcached -it --rm \
  --publish 11211:11211 \
  sameersbn/memcached:latest -h
```

# Maintenance

## Upgrading

To upgrade to newer releases:

  1. Download the updated Docker image:

  ```bash
  docker pull sameersbn/memcached:latest
  ```

  2. Stop the currently running image:

  ```bash
  docker stop memcached
  ```

  3. Remove the stopped container

  ```bash
  docker rm -v memcached
  ```

  4. Start the updated image

  ```bash
  docker run -name memcached -d \
    [OPTIONS] \
    sameersbn/memcached:latest
  ```

## Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version `1.3.0` or higher you can access a running containers shell by starting `bash` using `docker exec`:

```bash
docker exec -it memcached bash
```
