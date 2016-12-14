module Caplinked
  module REST
    module Workspaces

      def list_all_workspaces_for_a_team(options = {})
        params = options.stringify_keys.slice('team_id')
        perform_get('/api/v1/workspaces', params)
      end

      def create_workspace(options = {})
        body = options.stringify_keys.slice('team_id', 'workspace')
        perform_post('/api/v1/workspaces', nil, body.to_json, {'Content-Type' => 'application/json'} )
      end

      def get_workspace_info(options = {})
        params = options.stringify_keys.slice('id')
        id = params.delete('id')
        perform_get('/api/v1/workspaces/' + id.to_s, nil)
      end

      def update_workspace_info(options = {})
        params = {}
        body = options.stringify_keys.slice('id', 'workspace')
        id = body.delete('id')
        perform_put('/api/v1/workspaces/' + id.to_s, params, body.to_json, { 'Content-Type' => 'application/json' } )
      end
    end
  end
end
