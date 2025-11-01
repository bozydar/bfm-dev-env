require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require "net/http"
require "uri"

get '/' do
  db_value = access_db
  service1_value = access_service1
  service2_value = access_service2
  <<~END
  ====== BFM ======
  Hello from BFM monolith.
  DB says: #{db_value}. 
  ====== service1 ======
  #{service1_value} 
  ====== service2 ======
  #{service2_value}
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

def access_service1
  uri = URI("http://service1:4567/")
  res = Net::HTTP.get_response(uri)
  print("-----------------")
  print(res)
  if res.is_a?(Net::HTTPSuccess)
    content_type :json
    res.body
  else
    status 500
    "Error fetching data"
  end
end

def access_service2
  uri = URI("http://service2:4567/")
  res = Net::HTTP.get_response(uri)
  print("-----------------")
  print(res)
  if res.is_a?(Net::HTTPSuccess)
    content_type :json
    res.body
  else
    status 500
    "Error fetching data"
  end
end