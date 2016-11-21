require 'caplinked/utils'
require 'caplinked/request'
require 'active_support'

module Caplinked
  module Utils
    def perform_put_with_binary_data(path, params = {}, file)
      perform_request(:put, path, { params: params, body: file })
    end

    private
    def perform_request(request_method, path, options = {})
      Caplinked::Request.new(self, request_method, path, options).perform
    end
  end
end