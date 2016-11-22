module Caplinked
  module REST
    module Files
      # Options:
      #   - workspace_id (required)
      #   - folder_id (required)
      #   - file_name (required)
      #   - file (required)
      def upload_file(options = {})
        params = options.stringify_keys.slice('workspace_id', 'folder_id', 'file_name')
        file = options.stringify_keys['file'].b
        perform_put_with_binary_data('/api/v1/files/upload', params, file)
      end

      # Options:
      #   - id (required)
      #   - workspace_id (required)
      #   - page_number
      def get_file_info(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id', 'page_number')
        file_id = params.delete('id') 
        perform_get('/api/v1/files/' + file_id.to_s, params)
      end

      # Options:
      #   - id (required)
      #   - workspace_id (required)
      #   - expiring_token (required)
      def get_file_viewer(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id', 'expiring_token')
        file_id = params.delete('id') 
        perform_get('/api/v1/files/' + file_id.to_s + '/viewer', params)
      end
    end
  end
end