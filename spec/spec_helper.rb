require 'simplecov'
require 'vcr'
require 'pry'
require 'dotenv'
require 'webmock'

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

# WebMock.disable_net_connect!
#
# VCR.configure do |c|
#   c.cassette_library_dir = 'spec/fixtures/cassettes'
#   c.default_cassette_options = { record: :once }
#   c.hook_into :webmock
#   #hides API_KEY in the cassettes
#   c.filter_sensitive_data('<ENCODED X-Token>'){ ENV["API_KEY"] }
#   c.filter_sensitive_data('<ENCODED X-Token>'){ ENV["ORG_KEY"] }
#   c.filter_sensitive_data('<ENCODED X-Token>'){ ENV["USER_KEY"] }
# end
