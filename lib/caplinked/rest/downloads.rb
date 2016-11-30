module Caplinked
  module REST
    module Downloads
      # Options:
      #   - workspace_id (required)
      #   - download[folder_ids] (optional)
      #   - download[file_ids] (optional)
      def create_zip_file(options = {})
        params = options.stringify_keys.slice('workspace_id', 'download[folder_ids]', 'download[file_ids]')
        perform_post('/api/v1/downloads', params)
      end
    end
  end
end
