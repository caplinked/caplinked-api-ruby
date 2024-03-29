module Caplinked
  module REST
    module Teams

      def create_team(options = {})
        body = options.stringify_keys.slice('team')
        perform_post('/api/v1/teams', {}, body.to_json, {'Content-Type' => 'application/json'} )
      end

      def get_list_of_teams(options = {})
        perform_get('/api/v1/teams')
      end

      def get_team_info(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/teams/' + id.to_s, nil )
      end

      def update_team_info(options = {})
        body = options.stringify_keys.slice('id', 'team')
        id = body.delete('id')
        perform_put('/api/v1/teams/' + id.to_s, {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def add_team_member(options = {})
        body = options.stringify_keys.slice('id', 'user_id', 'email')
        id = body.delete('id')
        perform_post('/api/v1/teams/' + id.to_s + '/memberships', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def remove_team_member(options = {})
        body = options.stringify_keys.slice('id', 'user_id')
        id = body.delete('id')
        perform_delete('/api/v1/teams/' + id.to_s + '/memberships', {}, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def get_list_of_team_members(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/teams/' + id.to_s + '/memberships', nil )
      end

      def get_list_of_team_watermarks(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/teams/' + id.to_s + '/watermark_settings', nil )
      end

    end
  end
end
