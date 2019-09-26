FROM ruby:2.7-rc

RUN gem install bundle
RUN apt-get update -qq \
  && apt-get install -y -qq libncurses5-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev

WORKDIR /projeto
COPY Gemfile /projeto/Gemfile
COPY Gemfile.lock /projeto/Gemfile.lock
RUN bundle update --all
RUN bundle install
CMD ruby main.rb
