module Caplinked
  module REST
    module Users

      def create_user(options = {})
        body = options.stringify_keys.slice('user')
        perform_post('/api/v1/users', nil, body.to_json, {'Content-Type' => 'application/json'} )
      end

    end
  end
end
