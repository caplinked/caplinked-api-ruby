module Caplinked
  module REST
    module Organizations

      def get_organization_info(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/organizations/' + id.to_s, nil )
      end

      def update_organization_info(options = {})
        params = {}
        body = options.stringify_keys.slice('id', 'name', 'description', 'location', 'billing_email', 'url')
        id = body.delete('id')
        perform_put('/api/v1/organizations/' + id.to_s, params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def update_organization_support_info(options = {})
        params = {}
        body = options.stringify_keys.slice('id', 'phone_number', 'email', 'website')
        id = body.delete('id')
        perform_put('/api/v1/organizations/' + id.to_s + '/support_information', params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def add_organization_member(options = {})
        params = {}
        body = options.stringify_keys.slice('id', 'user_id')
        id = body.delete('id')
        perform_post('/api/v1/organizations/' + id.to_s + '/memberships', params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def remove_organization_member(options = {})
        params = options.stringify_keys.slice('id', 'user_id')
        id = params.delete('id')
        perform_delete('/api/v1/organizations/' + id.to_s + '/memberships', params )
      end

      def show_organization_members(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/organizations/' + id.to_s + '/memberships', nil )
      end
    end
  end
end
