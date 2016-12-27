require 'simplecov'
require 'vcr'
require 'pry'
require 'dotenv'
require 'webmock/rspec'

Dotenv.load

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_adapter 'test_frameworks'
end

ENV["COVERAGE"] && SimpleCov.start do
  add_filter "/.rvm/"
end
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'caplinked-api'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end

WebMock.disable_net_connect!

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
