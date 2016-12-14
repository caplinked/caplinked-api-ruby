module Caplinked
  module REST
    module Users

      def create_user(options = {})
        body = options.stringify_keys.slice('user')
        perform_post('/api/v1/users', nil, body.to_json, {'Content-Type' => 'application/json'} )
      end

      def get_user_info(options = {})
        perform_get('/api/v1/users/me', nil )
      end

      def update_user(options = {})
        body = options.stringify_keys.slice('user')
        perform_put('/api/v1/users/me', nil, body.to_json, {'Content-Type' => 'application/json'} )
      end

    end
  end
end
