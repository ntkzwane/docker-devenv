#!/bin/zsh

DEV_ENV_DIR=/home/ntokozo/Development/projects/dev-env/
RAILS_ENV_DIR=$DEV_ENV_DIR/railsenv/

cp $RAILS_ENV_DIR/bin/d* bin/
cp $RAILS_ENV_DIR/Dockerfile $RAILS_ENV_DIR/docker-compose.yml .

