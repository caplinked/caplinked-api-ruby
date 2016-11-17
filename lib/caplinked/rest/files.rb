module Caplinked
  module REST
    module Files
      # Options:
      #   - workspace_id (required)
      #   - folder_id (required)
      #   - file_name (required)
      #   - file (required)
      def upload_file(options = {})
        params = options.stringify_keys.fetch('workspace_id', 'folder_id', 'file_name')
        file = options.stringify_keys['file']
        perform_put_with_binary_data('/api/v1/files/upload', params, file)
      end
    end
  end
end