FROM ruby:2.7-rc

RUN gem install bundle

WORKDIR /projeto
COPY Gemfile /projeto/Gemfile
COPY Gemfile.lock /projeto/Gemfile.lock
RUN bundle update --all
RUN bundle install
CMD ruby main.rb
