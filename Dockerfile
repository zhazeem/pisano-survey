FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /pisano-survey
WORKDIR /pisano-survey
COPY Gemfile /pisano-survey/Gemfile
COPY Gemfile.lock /pisano-survey/Gemfile.lock
COPY .env.default /pisano-survey/.env
RUN bundle install
