FROM ruby:latest
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /projeto
WORKDIR /projeto
COPY Gemfile /projeto/Gemfile
COPY Gemfile.lock /projeto/Gemfile.lock
RUN bundle install
COPY . /projeto
