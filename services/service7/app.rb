require 'sinatra'

get '/' do
  "Hello from #{File.basename(__dir__)}"
end
