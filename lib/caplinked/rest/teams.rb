module Caplinked
  module REST
    module Teams

      def create_team(options = {})
        body = options.stringify_keys.slice('team')
        perform_post('/api/v1/teams', nil, body.to_json, {'Content-Type' => 'application/json'} )
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
        params = {}
        body = options.stringify_keys.slice('id', 'team')
        id = body.delete('id')
        perform_put('/api/v1/teams/' + id.to_s, params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def add_team_member(options = {})
        params = {}
        body = options.stringify_keys.slice('id', 'user_id')
        id = body.delete('id')
        perform_post('/api/v1/teams/' + id.to_s + '/memberships', params, body.to_json, { 'Content-Type' => 'application/json' } )
      end

      def remove_team_member(options = {})
        params = options.stringify_keys.slice('id', 'user_id')
        id = params.delete('id')
        perform_delete('/api/v1/teams/' + id.to_s + '/memberships', params )
      end

      def get_list_of_team_members(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/teams/' + id.to_s + '/memberships', nil )
      end

    end
  end
end
