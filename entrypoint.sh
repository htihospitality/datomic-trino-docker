#!/usr/bin/env sh

export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2

cd /opt/presto-server
bin/launcher run --etc-dir=etc
