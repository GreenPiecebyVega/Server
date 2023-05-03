FROM ruby:3.2.2-alpine AS base

ENV BUNDLER_VERSION 2.4.10
ENV RAILS_VERSION 7.0.4.3

RUN apk add --update --no-cache \
    vim \
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

# Enable use inside container
RUN gem install bundler -v $BUNDLER_VERSION && \
    gem install rails -v $RAILS_VERSION

FROM base
# ARGS #
ENV APP_ROOT greenpiece
ENV BUNDLE_CACHE_PATH /greenpiece/vendor/bundle
ENV BUNDLE_PATH /greenpiece/vendor/bundle
ENV BUNDLE_BIN /greenpiece/vendor/bundle/bin
ENV USER developer_user
ENV GROUP developer
ENV USER_ID 1000
ENV GROUP_ID 1001

RUN addgroup -g $GROUP_ID --system $GROUP && \
    adduser -u $USER_ID --gecos '' -G $GROUP --disabled-password $USER

USER $USER

WORKDIR $APP_ROOT

COPY --chown=$USER Gemfile Gemfile.lock ./

RUN bundle install

COPY --chown=$USER . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]