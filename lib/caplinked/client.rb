require 'caplinked/rest/api'

module Caplinked
  class Client
    include Caplinked::REST::API
    attr_accessor :api_key, :api_host

    # Usage:
    # client = Caplinked::Client.new api_key: '...', api_host: 'sandbox.caplinked.com'
    # client.upload_file file_name: '...', 
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set "@#{key}", value
      end
      yield(self) if block_given?
    end
  end
end

