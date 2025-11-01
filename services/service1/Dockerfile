FROM ruby:3.2
WORKDIR /workspace
RUN gem install rackup puma sinatra sinatra-contrib rerun pg
EXPOSE 4567
CMD ["ruby", "app.rb", "-o", "0.0.0.0", "-e", "development"]
