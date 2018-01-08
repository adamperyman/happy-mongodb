#!/bin/bash
set -m

# Check for env vars
if [ -z ${MONGODB_ADMIN_USER+x} ]; then
  echo "ENV variable MONGODB_ADMIN_USER is undefined."
  exit 1
fi

if [ -z ${MONGODB_ADMIN_PASS+x} ]; then
  echo "ENV variable MONGODB_ADMIN_PASS is undefined."
  exit 1
fi

if [ -z ${MONGODB_APPLICATION_DATABASE+x} ]; then
  echo "ENV variable MONGODB_APPLICATION_DATABASE is undefined."
  exit 1
fi

if [ -z ${MONGODB_APPLICATION_USER+x} ]; then
  echo "ENV variable MONGODB_APPLICATION_USER is undefined."
  exit 1
fi

if [ -z ${MONGODB_APPLICATION_PASS+x} ]; then
  echo "ENV variable MONGODB_APPLICATION_PASS is undefined."
  exit 1
fi

if [ -z ${MONGODB_DATA_VOLUME+x} ]; then
  echo "ENV variable MONGODB_APPLICATION_PASS is undefined."
  exit 1
fi

# Begin server setup
mongodb_cmd="mongod"
cmd="$mongodb_cmd --bind_ip_all"

if [ "$AUTH" == "yes" ]; then
  cmd="$cmd --auth"
fi

$cmd &

if [ ! -f $MONGODB_DATA_VOLUME/.mongodb_password_set ]; then
  /set_mongodb_password.sh
fi

fg
