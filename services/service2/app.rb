require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require "net/http"
require "uri"
set :host_authorization, { allow_if: -> (*) { true } }

get '/' do
  db_value = access_db
  <<~END
  Hello from Service2. 
  DB says: #{db_value}"
  END
end

def access_db
  db_uri = URI.parse(ENV["DATABASE_URL"])

  conn = PG.connect(
    host: db_uri.host,
    port: db_uri.port || 5432,
    dbname: db_uri.path[1..-1],   # remove the leading "/"
    user: db_uri.user,
    password: db_uri.password
  )
  conn.exec("SELECT name FROM info").first["name"]
end
