FROM engineyard/kontainers:ruby-3.0.0-v1.0.0
RUN apt-get update -qq && apt-get install -y nodejs libsqlite3-dev shared-mime-info

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
#COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . /app

RUN bundle exec rake db:migrate RAILS_ENV=development
RUN bundle exec rake db:seed

EXPOSE 3000

CMD ls
CMD bundle exec puma -C config/puma.rb
