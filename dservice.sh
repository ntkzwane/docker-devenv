#!/bin/zsh

DEV_ENV_DIR=/home/ntokozo/Development/projects/dev-env/
if [ "$1" '==' "up" ] || [ "$1" '==' "start" ]; then
  docker-compose -f $DEV_ENV_DIR/$2.yml up -d
elif [ "$1" '==' "down" ] || [ "$1" '==' "stop" ]; then
  docker-compose -f $DEV_ENV_DIR/$2.yml down
else
  echo "Invalid option $1"
fi

