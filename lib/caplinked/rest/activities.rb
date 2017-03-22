module Caplinked
  module REST
    module Activities
      def get_workspace_activities(options = {})
        params = options.stringify_keys.slice('workspace_id', 'user_id', 'per_page', 'page')
        workspace_id = params.delete('workspace_id')
        perform_get('/api/v1/activities/workspace/' + workspace_id.to_s, params)
      end
    end
  end
end
