require "pg"
require 'rspec'
require "net/http"
require "uri"
require 'pg'

def build_connection(url)
  db_uri = URI.parse(url)
  PG.connect(
    host: db_uri.host,
    port: db_uri.port || 5432,
    dbname: db_uri.path[1..-1],   # remove the leading "/"
    user: db_uri.user,
    password: db_uri.password
  )
end

RSpec.describe "BFM integration test" do
  let!(:bfm_conn) { build_connection(ENV["BFM_DATABASE_URL"]) }
  let!(:service2_conn) { build_connection(ENV["SERVICE2_DATABASE_URL"]) }
  before do
    bfm_conn.exec("INSERT INTO info (name) VALUES ('hello from bfm_test db')")
    service2_conn.exec("INSERT INTO info (name) VALUES ('hello from service2_test db')")
  end

  after do
    # bfm_conn.exec("TRUNCATE TABLE info")
    # service2_conn.exec("TRUNCATE TABLE info")
  end

  it "connects and reads data" do
    result = access_bfm
    expect(result.include?("Hello from BFM")).to be_truthy
    expect(result.include?("Hello from Service1")).to be_truthy
    expect(result.include?("hello from bfm_test db")).to be_truthy
    expect(result.include?("Hello from Service2")).to be_truthy
    expect(result.include?("hello from service2_test db")).to be_truthy
  end
end

def access_bfm
  uri = URI("http://bfm:4567/")
  res = Net::HTTP.get_response(uri)
  if res.is_a?(Net::HTTPSuccess)
    res.body
  else
    print res.body
    raise "Error fetching data"
  end
end