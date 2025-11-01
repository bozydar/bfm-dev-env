FROM ruby:3.2
WORKDIR /workspace
COPY . .
RUN gem install pg rspec
EXPOSE 4567
CMD ["rspec"]
