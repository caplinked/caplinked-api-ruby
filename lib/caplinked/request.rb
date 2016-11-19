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
      @uri = Addressable::URI.parse("https://#{client.api_host}#{path}")
      @path = @uri.path
      @options = options
    end

    def perform
      options_key = @request_method == :get ? :params : :form
      response = HTTP.headers('X-Token' => client.api_key).public_send(@request_method, @uri.to_s, options_key => @options[:params])
      response_headers = response.headers
      response_body = response.body.empty? ? '' : symbolize_keys!(response.parse)
    end
  end
end