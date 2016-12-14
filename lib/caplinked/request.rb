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
      headers = (@options.delete(:headers) || {}).merge('X-Token' => client.api_key)
      @uri.query_values = @options.delete(:params)
      response = HTTP.headers(headers).request(@request_method, @uri.to_s, @options)
      if response.parse.class == Hash
        response_body = response.body.empty? ? '' : response.parse.symbolize_keys!
      else
        response_body = response.body.empty? ? '' : response.parse
      end
      response_headers = response.headers
      fail_or_return_response_body(response.code, response_body, response_headers)
    end

  private
    def fail_or_return_response_body(code, body, headers)
      if body.class == Hash
        raise(Caplinked::Error.from_response(body, headers)) if body[:error].present?
      else
        if body[0].present?
          raise(Caplinked::Error.from_response(body, headers)) if body[0][:error].present?
        else
          raise(Caplinked::Error.from_response(body, headers)) if body[0].try([:error]).present?
        end
      end

      body
    end
  end
end
