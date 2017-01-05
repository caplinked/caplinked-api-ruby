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
      headers = (@options.delete(:headers) || {}).merge('X-Token' => @client.api_key)
      @uri.query_values = @options.delete(:params)
      response = HTTP.headers(headers).request(@request_method, @uri.to_s, @options)
      response_body = response.body.empty? ? '' : change_keys_to_symbols(response.parse)
      response_headers = response.headers
      fail_or_return_response_body(response.code, response_body, response_headers)
    end

  private
    def change_keys_to_symbols(parsed_response)
      if parsed_response.is_a?(Hash)
        parsed_response.deep_symbolize_keys
      elsif parsed_response.is_a?(Array)
        parsed_response.map { |h| h.deep_symbolize_keys }
      else
        parsed_response
      end
    end

    def fail_or_return_response_body(code, body, headers)
      raise(Caplinked::Error.from_response(body, headers)) if body.is_a?(Hash) && body[:error].present?
      body
    end
  end
end
