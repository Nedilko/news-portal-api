# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y postgresql-client && mkdir /app

RUN gem update --system && gem install bundler -v 2.3.11

COPY Gemfile Gemfile.lock /app/
WORKDIR /app

RUN /usr/local/bin/bundle install

# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"

# COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3100

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3100"]
