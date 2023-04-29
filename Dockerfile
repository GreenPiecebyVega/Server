FROM ruby:3.2.2-alpine

ENV BUNDLER_VERSION=2.4.10
ENV APP_ROOT /greenpiece
ENV BUNDLE_CACHE_PATH /greenpiece/vendor/bundle
ENV BUNDLE_PATH /usr/local/bundle
ENV BUNDLE_BIN /usr/local/bundle/bin
ENV USER=dev
ENV GROUP=developer
ENV USER_ID=1000
ENV GROUP_ID=1001

RUN apk add --update --no-cache \
  gcc \
  g++ \
  git \
  libstdc++ \
  libffi-dev \
  libc-dev \ 
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  libgcrypt-dev \
  make \
  netcat-openbsd \
  nodejs \
  openssl \
  pkgconfig \
  tzdata \
  yarn \
  bash \
  ruby-dev \
  mariadb-dev \
  mariadb-connector-c-dev

RUN addgroup -g $GROUP_ID --system $GROUP && \
    adduser -u $USER_ID --gecos '' -G $GROUP --disabled-password $USER

RUN mkdir ${APP_ROOT} && \
    chown ${USER_ID}:${GROUP_ID} ${APP_ROOT}

RUN bundle config --global frozen 1

USER ${USER}
WORKDIR /greenpiece

COPY --chown=${USER} Gemfile Gemfile.lock ./

RUN gem update --system --no-document && \
    gem install -N bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"

RUN bundle config set path /greenpiece/vendor/bundle

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY --chown=${USER}_ID:${GROUP_ID} . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]