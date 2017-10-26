FROM ruby:2.4.2-slim

ENV APP_ROOT /app
ENV RAILS_ENV production
ENV PATH /root/.yarn/bin:$PATH

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y --no-install-recommends   git \
    make \
    g++ \
    tzdata \
    libxml2 \
    bzip2 \
    ca-certificates \
    libffi-dev \
    libgdbm3 \
    libssl-dev \
    libyaml-dev \
    procps \
    zlib1g-dev \
    openssh-server \
    libsqlite3-dev \
    curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -   && apt-get install -y nodejs
RUN /bin/bash   && touch ~/.bashrc   && curl -o- -L https://yarnpkg.com/install.sh | bash
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p ~/.ssh/ && ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test --jobs=4

COPY . $APP_ROOT

ARG DOCKER_BUILD=true
ARG SECRET_KEY_BASE=temp

RUN bundle exec rake assets:precompile
