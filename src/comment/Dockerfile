FROM ruby:2.2-alpine

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments
ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# App requiremets (fat layer)
COPY Gemfile* $APP_HOME/
RUN apk add --no-cache --virtual .build-deps build-base \
    && bundle install \
    && bundle clean \
    && apk del .build-deps

# App (frequently changing layer)
COPY . $APP_HOME

CMD ["puma"]

