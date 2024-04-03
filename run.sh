#! /bin/bash

export MY_USERNAME=$(whoami)
export MY_SSH_KEY=$(cat ~/.ssh/id_ed25519.pub)

docker compose up