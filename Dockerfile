FROM ruby:2.4.3
MAINTAINER Yuji Takaesu <taka.esu.user@gmail.com>

ENV BUNDLE_PATH=/app/bundle \
    APP_DIR=/app/excel-transpose

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
COPY . $APP_DIR
RUN bundle install --path $BUNDLE_PATH -j4

VOLUME $APP_DIR
