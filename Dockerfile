FROM ruby:3.2.2-alpine AS base

ENV APP_ROOT greenpiece
ENV BUNDLE_CACHE_PATH /greenpiece/vendor/bundle
ENV BUNDLE_PATH /usr/local/bundle
ENV BUNDLE_BIN /usr/local/bundle/bin

# Bundler unauthorized acess to gems error
# ENV USER developer_user
# ENV GROUP developer
# ENV USER_ID 1000
# ENV GROUP_ID 1001

# RUN addgroup -g $GROUP_ID --system $GROUP && \
#     adduser -u $USER_ID --gecos '' -G $GROUP --disabled-password $USER

# USER $USER

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

FROM base

WORKDIR $APP_ROOT

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]