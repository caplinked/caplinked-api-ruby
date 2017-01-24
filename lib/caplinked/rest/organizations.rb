module Caplinked
  module REST
    module Organizations

      def get_organization_info(options = {})
        perform_get('/api/v1/organization')
      end

      def update_organization_info(options = {})
        params = {}
        body = options.stringify_keys.slice('name', 'description', 'location', 'billing_email', 'url')
        perform_put('/api/v1/organization', params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def update_organization_support_info(options = {})
        params = {}
        body = options.stringify_keys.slice('phone_number', 'email', 'website')
        perform_put('/api/v1/organization/support_information', params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def add_organization_member(options = {})
        params = {}
        body = options.stringify_keys.slice('user_id')
        perform_post('/api/v1/organization/memberships', params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def remove_organization_member(options = {})
        params = options.stringify_keys.slice('user_id')
        perform_delete('/api/v1/organization/memberships', params )
      end

      def show_organization_members(options = {})
        perform_get('/api/v1/organization/memberships', nil )
      end
    end
  end
end
