# In terms of functionality, Ubuntu may provide more features, options and documentation for development and deployment. If security is paramount, Alpine may have a smaller attack surface and more security features.
# If performance is a priority, Alpine might be a better choice due to its faster speed.
FROM ruby:3.2.2-alpine AS greenpiece

# Dependencies
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
    mariadb-connector-c-dev \
    acl \
    tzdata

RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
ENV TZ America/Sao_Paulo
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

# Bundle
ENV BUNDLER_VERSION 2.4.10
ENV BUNDLE_CACHE_PATH /usr/local/bundle/cache
ENV BUNDLE_PATH /usr/local/bundle
ENV BUNDLE_BIN /usr/local/bundle/bin

# Install Bundler
RUN gem install bundler -v "$BUNDLER_VERSION"

# APP USER
ENV USER developer
ENV GROUP development
ENV USER_ID 1000
ENV GROUP_ID 1001

RUN addgroup -g $GROUP_ID --system $GROUP && \
    adduser -u $USER_ID --gecos '' -G $GROUP --disabled-password $USER

# Set the app directory
ENV APP_DIRECTORY /greenpiece
RUN mkdir $APP_DIRECTORY

# Switch to root user for permission changes
USER root

# Grant permissions to the user
RUN setfacl -m u:$USER:rwx $APP_DIRECTORY
RUN setfacl -m u:$USER:rwx $BUNDLE_PATH

# Change ownership of directories
RUN chown -R $USER:$GROUP $APP_DIRECTORY
RUN chown -R $USER:$GROUP $BUNDLE_PATH

# Set the working directory
WORKDIR $APP_DIRECTORY

# Switch back to the regular user
USER $USER

COPY --chown=$USER Gemfile Gemfile.lock $APP_DIRECTORY/

RUN bundle check || bundle install

COPY . $APP_DIRECTORY/

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]