require "pg"
require 'rspec'
require "net/http"
require "uri"

RSpec.describe "BFM integration test" do
  it "connects and reads data" do
    result = access_bfm
    expect(result.include?("Hello from BFM")).to be_truthy
    expect(result.include?("Hello from Service1")).to be_truthy
    expect(result.include?("hello from bfm_development db")).to be_truthy
    expect(result.include?("Hello from Service2")).to be_truthy
    expect(result.include?("hello from service2_development db")).to be_truthy
  end
end

def access_bfm
  uri = URI("http://bfm:4567/")
  res = Net::HTTP.get_response(uri)
  if res.is_a?(Net::HTTPSuccess)
    res.body
  else
    raise "Error fetching data"
  end
end