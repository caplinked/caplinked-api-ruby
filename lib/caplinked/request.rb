require 'addressable/uri'
require 'http'
require 'http/form_data'
require 'json'

module Caplinked
  class Request
    attr_accessor :client, :request_method, :path, :headers, :params, :uri

    def initialize(client, request_method, path, options = {})
      @client = client
      @request_method = request_method
      @uri = Addressable::URI.parse("#{client.api_scheme}://#{client.api_host}#{path}")
      @path = @uri.path
      @options = options
    end

    def perform
      @uri.query_values = @options.delete(:params)
      response = HTTP.headers('X-Token' => client.api_key).request(@request_method, @uri.to_s, @options)
      response_headers = response.headers
      response.body.empty? ? '' : response.parse.symbolize_keys!
    end
  end
end