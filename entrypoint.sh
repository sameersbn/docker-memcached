#!/bin/bash
set -e

EXTRA_OPTS=${EXTRA_OPTS:-}
CACHE_SIZE=${CACHE_SIZE:-64}

# allow arguments to be passed to memcached
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == memcached || ${1} == $(which memcached) ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

# default behaviour is to launch memcached
if [[ -z ${1} ]]; then
  exec $(which memcached) -v -m ${CACHE_SIZE} -p 11211 -u nobody ${EXTRA_OPTS} ${EXTRA_ARGS}
else
  exec "$@"
fi
