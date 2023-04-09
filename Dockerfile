FROM ruby:3.2.2-alpine

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV APP_ROOT /app
ENV BUNDLE_CACHE_PATH /app/vendor/bundle
ENV BUNDLE_PATH /usr/local/bundle
ENV BUNDLE_BIN /usr/local/bundle/bin
ENV USER=greenpiece
ENV GROUP=greenpiece

RUN addgroup -g $GROUP_ID --system $GROUP && \
    adduser -u $USER_ID --gecos '' -G $GROUP --disabled-password $USER

RUN apk add --no-cache --update --virtual run-dependencies \
  bash \
  build-base \
  ruby-dev \
  gcc \
  make \
  libffi-dev \
  libstdc++ gcompat \
  mariadb-dev \
  mariadb-connector-c-dev



RUN mkdir $APP_ROOT && \
    chown $USER_ID:$GROUP_ID $APP_ROOT

RUN bundle config --global frozen 1

USER $USER

WORKDIR $APP_ROOT

COPY --chown=$USER Gemfile Gemfile.lock ./

RUN bundle config set path vendor/bundle

RUN [ -f /vendor/bundle.tgz ] && tar -xvzf /vendor/bundle.tgz -C /vendor/ || bundle install

RUN bundle check

COPY --chown=$USER_ID:$GROUP_ID . .
