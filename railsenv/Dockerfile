FROM ruby:2.5.1-slim

RUN mkdir /app
WORKDIR /app

# ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl libxml2-dev

# node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

# postgresql and heroku client
RUN wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
RUN apt-get install software-properties-common -y && \
  add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  apt-get update && apt-get install -y git postgresql-client-10

# install dependencies
COPY Gemfil* /app/
RUN bundle install

# Cleanup
RUN apt-get purge curl apt-transport-https wget software-properties-common -y

