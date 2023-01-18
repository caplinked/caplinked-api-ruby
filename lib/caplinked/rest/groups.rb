module Caplinked
  module REST
    module Groups

      def list_all_groups_in_workspace(options = {})
        params = options.stringify_keys.slice('workspace_id')
        perform_get('/api/v1/groups', params)
      end

      def create_group(options = {})
        body = options.stringify_keys.slice('group')
        perform_post('/api/v1/groups', {}, body.to_json, {'Content-Type' => 'application/json'} )
      end

      def update_group(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id', 'group')
        id = body.delete('id')
        perform_put('/api/v1/groups/' + id.to_s, {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def get_group_info(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id')
        id = params.delete('id')
        perform_get('/api/v1/groups/' + id.to_s, params)
      end

      def delete_group(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id')
        id = body.delete('id')
        perform_delete('/api/v1/groups/' + id.to_s, {}, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def update_group_drm(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id', 'group')
        id = body.delete('id')
        perform_put('/api/v1/groups/' + id.to_s + '/drm', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def disable_drm_expiration(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id')
        id = body.delete('id')
        perform_put('/api/v1/groups/' + id.to_s + '/disable_drm_expiration', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def watermarking_for_group(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id', 'group')
        id = body.delete('id')
        perform_put('/api/v1/groups/' + id.to_s + '/watermarking', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def enable_access_expiration(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id', 'group')
        id = body.delete('id')
        perform_put('/api/v1/groups/' + id.to_s + '/enable_expire_access', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def disable_access_expiration(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id')
        id = body.delete('id')
        perform_put('/api/v1/groups/' + id.to_s + '/disable_expire_access', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def add_group_member(options = {})
        body = options.stringify_keys.slice('id', 'user_id', 'email', 'workspace_id', 'send_email')
        id = body.delete('id')
        perform_post('/api/v1/groups/' + id.to_s + '/memberships', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def remove_group_member(options = {})
        body = options.stringify_keys.slice('id', 'user_id', 'workspace_id')
        id = body.delete('id')
        perform_delete('/api/v1/groups/' + id.to_s + '/memberships', {}, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def list_all_group_members(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id')
        id = params.delete('id')
        perform_get('/api/v1/groups/' + id.to_s + '/memberships', params )
      end

    end
  end
end
