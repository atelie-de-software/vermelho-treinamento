FROM ruby:2.7-rc

RUN gem install bundle
RUN apt-get update -qq \
  && apt-get install libncurses5-dev

WORKDIR /projeto
COPY Gemfile /projeto/Gemfile
COPY Gemfile.lock /projeto/Gemfile.lock
RUN bundle update --all
RUN bundle install
CMD ruby main.rb
