FROM ruby:3.1.0
WORKDIR /book-allocation
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN chmod -R 775 /turbo-todo
RUN rake assets:precompile
EXPOSE 3000
CMD bundle exec puma -C config/puma.rb