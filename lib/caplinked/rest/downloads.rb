module Caplinked
  module REST
    module Downloads
      # Options:
      #   - workspace_id (required)
      #   - download[folder_ids] (optional)
      #   - download[file_ids] (optional)
      def create_zip_file(options = {})
        params = {}
        body = options.stringify_keys.slice('workspace_id', 'download')
        perform_post('/api/v1/downloads', params, body.to_json, { 'Content-Type' => 'application/json' })
      end
    end
  end
end
