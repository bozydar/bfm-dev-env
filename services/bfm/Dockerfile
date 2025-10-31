FROM ruby:3.2
WORKDIR /workspace
COPY app.rb .
RUN gem install sinatra pg
EXPOSE 4567
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
