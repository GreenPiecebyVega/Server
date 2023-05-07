FROM ruby:3.2.2-alpine AS greenpiece

ENV RAILS_ENV development

# dependencies
RUN apk add --update --no-cache \
    build-base \
    vim \
    gcc \
    g++ \
    git \
    libstdc++ \
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
    libffi \
    mariadb-dev \
    mariadb-connector-c-dev

# Bundle
ENV BUNDLER_VERSION 2.4.10
ENV BUNDLE_CACHE_PATH /usr/local/bundle/cache
ENV BUNDLE_PATH /usr/local/bundle
ENV BUNDLE_BIN /usr/local/bundle/bin

# APP USER
ENV USER developer
ENV GROUP development
ENV USER_ID 1000
ENV GROUP_ID 1001

RUN addgroup -g $GROUP_ID --system $GROUP && \
    adduser -u $USER_ID --gecos '' -G $GROUP --disabled-password $USER

# APP
ENV app_directory /greenpiece
RUN mkdir $app_directory
WORKDIR $app_directory

USER root

RUN chown -R $USER_ID:$GROUP_ID $app_directory
RUN chown -R $USER_ID:$GROUP_ID $BUNDLE_PATH

USER $USER

COPY Gemfile Gemfile.lock $app_directory/

RUN bundle config build.nokogiri --use-system-libraries && \
    bundle install

COPY . $app_directory/

EXPOSE 3000

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]