#!/bin/bash

# from https://gist.github.com/earthgecko/3089509
random-string()
{
    cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

mkdir -p keys/web keys/worker

ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''

ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''

cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys
cp ./keys/web/tsa_host_key.pub ./keys/worker

mkdir -p keys/storage

echo "MINIO_ACCESS_KEY=$(random-string 20)" > ./keys/storage/storage.env
echo "MINIO_SECRET_KEY=$(random-string 40)" >> ./keys/storage/storage.env