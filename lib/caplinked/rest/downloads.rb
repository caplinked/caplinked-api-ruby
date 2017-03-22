module Caplinked
  module REST
    module Downloads
      def create_zip_file(options = {})
        body = options.stringify_keys.slice('workspace_id', 'download')
        perform_post('/api/v1/downloads', {}, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def single_file_download(options = {})
        params = options.stringify_keys.slice('file_id', 'workspace_id')
        file_id = params.delete('file_id')
        perform_get('/api/v1/downloads/file/' + file_id.to_s, params)
      end

      def download_status(options = {})
        params = options.stringify_keys.slice('workspace_id')
        workspace_id = params.delete('workspace_id')
        perform_get('/api/v1/downloads/status/' + workspace_id.to_s, nil)
      end

      def delete_download(options = {})
        body = options.stringify_keys.slice('id', 'workspace_id')
        id = body.delete('id')
        perform_delete('/api/v1/downloads/' + id.to_s, {}, body.to_json, { 'Content-Type' => 'application/json' })
      end

      def get_zip(options = {})
        params = options.stringify_keys.slice('id', 'workspace_id')
        id = params.delete('id')
        perform_get('/api/v1/downloads/' + id.to_s, params)
      end
    end
  end
end
