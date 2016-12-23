require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'It returns workspace activity' do
    VCR.use_cassette("activities/workspace_activites", :record => :none) do
      get_workspace_activities = client.get_workspace_activities(
        workspace_id: 5886)

      expect(get_workspace_activities[:pagination]).to include({"total_pages"=>2,
                                                  "page"=>1, "per_page"=>100})
      expect(get_workspace_activities[:events].first).to eq({"id"=>311537,
        "user_id"=>2, "user_name"=>"Jazz Garcha", "workspace_id"=>5886,
        "verb"=>"viewed", "message"=>"viewed this workspace",
        "subject_type"=>"Workspace", "subject_id"=>5886,
        "created_at"=>get_workspace_activities[:events].first["created_at"]})
    end
  end

  it 'It returns workspace activity with user filter' do
    VCR.use_cassette("activities/workspace_activites_user_filter", :record => :none) do
      get_workspace_activities = client.get_workspace_activities(
        workspace_id: 5886, user_id: 99)

      expect(get_workspace_activities[:pagination]).to include({"total_pages"=>1,
                                                  "page"=>1, "per_page"=>100})
      expect(get_workspace_activities[:events].first).to include({"user_id"=>99,
                                                      "workspace_id"=>5886})
    end
  end
end
