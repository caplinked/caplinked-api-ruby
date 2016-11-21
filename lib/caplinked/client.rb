require 'caplinked/error'
require 'caplinked/request'
require 'caplinked/utils'
require 'caplinked/rest/api'
require 'active_support'
require 'active_support/core_ext/hash'

module Caplinked
  class Client
    include Caplinked::Utils
    include Caplinked::REST::API
    attr_accessor :api_key, :api_host, :api_scheme

    # Usage:
    # client = Caplinked::Client.new api_key: '...', api_host: 'sandbox.caplinked.com'
    # client.upload_file file_name: '...', 
    def initialize(options = {})
      options[:api_host] ||= 'sandbox.caplinked.com'
      options[:api_scheme] ||= 'https'

      options.each do |key, value|
        instance_variable_set "@#{key}", value
      end
      yield(self) if block_given?
    end
  end
end

