module Caplinked
  module REST
    module Folders

      def create_a_new_folder(options = {})
        params = {}
        body = options.stringify_keys.slice('workspace_id', 'name', 'parent_id')
        perform_post('/api/v1/folders', params, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def delete_folder(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id')
        id = params.delete('id')
        perform_delete('/api/v1/folders/' + id.to_s, params )
      end

      def get_folder_info(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id')
        id = params.delete('id')
        perform_get('/api/v1/folders/' + id.to_s, params)
      end

      def update_folder_info(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        body = options.stringify_keys.slice('workspace_id', 'folder')
        perform_put('/api/v1/folders/' + id.to_s, params, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def copy_folder(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        body = options.stringify_keys.slice('workspace_id', 'destination_folder_id')
        perform_post('/api/v1/folders/' + id.to_s + '/copy', params, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def move_folder(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        body = options.stringify_keys.slice('workspace_id', 'destination_folder_id')
        perform_post('/api/v1/folders/' + id.to_s + '/move', params, body.to_json, { 'Content-Type' => 'application/json' })
      end
    end
  end
end
