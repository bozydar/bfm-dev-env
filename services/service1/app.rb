require 'sinatra'
require "sinatra/reloader" if development?
set :host_authorization, { allow_if: -> (*) { true } }

get '/' do
  "Hello from Service1"
end
