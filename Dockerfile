FROM ruby:2.5.0
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY app/Gemfile /usr/src/app
COPY app/Gemfile.lock /usr/src/app
RUN bundle install

CMD ["bash"]
