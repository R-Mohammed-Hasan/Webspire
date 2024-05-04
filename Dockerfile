FROM ruby:2.6.10

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /webspire
WORKDIR /webspire

ADD Gemfile /webspire/Gemfile
ADD Gemfile.lock /webspire/Gemfile.lock

RUN bundle install

ADD . /webspire

# RUN rails db:migrate
# RUN rails db:seed
