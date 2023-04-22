# syntax=docker/dockerfile:1
FROM ruby:3.1.2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

#ADD package.json .
#ADD yarn.lock .
#RUN yarn install

ADD . .

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-p", "3000"]