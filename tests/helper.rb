ENV["RACK_ENV"] = "test"

require_relative "../app"
require "cutest"
require "rack/test"

# Isolate the test database from our development database.
ENV["REDIS_URL"] = "redis://127.0.0.1:6379/15"

class Cutest::Scope
  include Rack::Test::Methods

  def app
    Cuba
  end
end

prepare do
  Ohm.flush
end
