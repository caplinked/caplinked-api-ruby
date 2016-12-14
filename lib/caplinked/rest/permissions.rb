module Caplinked
  module REST
    module Permissions

      def get_folder_permissions(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id', 'group_id')
        id = params.delete('id')
        perform_get('/api/v1/permissions/folders/' + id.to_s, params )
      end

      def update_folder_permissions(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        body = options.stringify_keys.slice('workspace_id', 'group_id', 'verb', 'folder_action')
        perform_put('/api/v1/permissions/folders/' + id.to_s, nil, body.to_json, {'Content-Type' => 'application/json'} )
      end

    end
  end
end
