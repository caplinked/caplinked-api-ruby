module Caplinked
  module REST
    module Activities
      def get_workspace_activities(options = {})
        params = options.stringify_keys.slice('workspace_id', 'user_id', 'per_page', 'page')
        file_id = params.delete('workspace_id')
        perform_get('/api/v1/activities/workspace/' + file_id.to_s, params)
      end

    end
  end
end
