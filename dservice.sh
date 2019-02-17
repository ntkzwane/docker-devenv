#!/bin/bash

COMMAND=$1
DEV_ENV_DIR=/home/ntokozo/Development/projects/docker-devenv/
# DEV_ENV_DIR=/vagrant # default for the vagrant environment

start_services () {
  for service in "$@"
  do
    docker-compose -f $DEV_ENV_DIR/$service.yml up -d
  done
}

stop_services () {
  for service in "$@"
  do
    docker-compose -f $DEV_ENV_DIR/$service.yml down
  done
}

shift # already have the command, just read in the remaining args
if [ "$COMMAND" '==' "up" ] || [ "$COMMAND" '==' "start" ]; then
  start_services $@
elif [ "$COMMAND" '==' "down" ] || [ "$COMMAND" '==' "stop" ]; then
  stop_services $@
else
  echo "Invalid option $COMMAND"
fi

