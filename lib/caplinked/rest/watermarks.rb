module Caplinked
  module REST
    module Watermarks

      def create_watermark(options = {})
        body = options.stringify_keys.slice(
          'team_id',
          'custom_text',
          'color',
          'opacity',
          'font_size',
          'rotation',
          'hposition',
          'vposition',
          'display_user_name',
          'display_user_email',
          'display_ip_address',
          'display_time',
          'display_workspace_name'
        )
        perform_post('/api/v1/watermark', {}, body.to_json, {'Content-Type' => 'application/json'} )
      end

      def get_watermark(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/watermark/' + id.to_s, nil)
      end

      def update_watermark(options = {})
        body = options.stringify_keys.slice(
          'id',
          'custom_text',
          'color',
          'opacity',
          'font_size',
          'rotation',
          'hposition',
          'vposition',
          'display_user_name',
          'display_user_email',
          'display_ip_address',
          'display_time',
          'display_workspace_name'
        )
        id = body.delete('id')
        perform_put('/api/v1/watermark/' + id.to_s, {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def delete_watermark(options = {})
        body = options.stringify_keys.slice('id')
        id = body.delete('id')
        perform_delete('/api/v1/watermark/' + id.to_s, {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end
    end
  end
end
