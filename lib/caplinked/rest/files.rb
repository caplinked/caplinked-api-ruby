module Caplinked
  module REST
    module Files
      def upload_file(options = {})
        params = options.stringify_keys.slice('workspace_id', 'folder_id', 'file_name')
        file = options.stringify_keys['file'].b
        perform_put_with_binary_data('/api/v1/files/upload', params, file)
      end

      def get_file_info(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id', 'page_number')
        file_id = params.delete('id')
        perform_get('/api/v1/files/' + file_id.to_s, params)
      end

      def get_file_viewer(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id', 'expiring_token')
        file_id = params.delete('id')
        perform_get('/api/v1/files/' + file_id.to_s + '/viewer', params)
      end

      def delete_file(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id')
        file_id = params.delete('id')
        perform_delete('/api/v1/files/' + file_id.to_s, params)
      end

      def update_file_info(options = {})
        params = options.stringify_keys.slice('id')
        file_id = params.delete('id')
        body = options.stringify_keys.slice('workspace_id', 'file')
        perform_put('/api/v1/files/' + file_id.to_s, params, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def copy_file(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id', 'destination_folder_id')
        file_id = params.delete('id')
        perform_post('/api/v1/files/' + file_id.to_s + '/copy', params)
      end

      def move_file(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id', 'destination_folder_id')
        file_id = body.delete('id')
        params = {}
        perform_post('/api/v1/files/' + file_id.to_s + '/move', params, body.to_json, { 'Content-Type' => 'application/json' })
      end
    end
  end
end
