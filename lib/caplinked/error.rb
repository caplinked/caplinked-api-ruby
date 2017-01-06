module Caplinked
  class Error < StandardError
    attr_reader :code, :headers

    class << self
      def from_response(body, headers)
        new(body[:error][:code], body[:error][:message], headers)
      end
    end

    def initialize(code = nil, message = '', headers = {})
      super(message)
      @code = code
      @headers = headers
    end
  end
end
