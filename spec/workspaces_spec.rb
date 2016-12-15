require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["ORG_KEY"], api_scheme: 'https' }

  xit 'list all workspaces for a team' do
    VCR.use_cassette("workspaces/list_all_workspaces_for_a_team", :record => :none) do
      list_all_workspaces_for_a_team = client.list_all_workspaces_for_a_team team_id: 183

      expect(list_all_workspaces_for_a_team).to eq([])
    end
  end

  it 'create a workspace' do
    VCR.use_cassette("workspaces/create_workspaces", :record => :none) do
      create_workspace = client.create_workspace team_id: 183, workspace: { name: 'api_workspacex3'}

      expect(create_workspace).to eq({:id=>5933, :name=>"api_workspacex3",
                                      :team_id=>183,
                                      :created_at=>create_workspace[:created_at],
                                      :updated_at=>create_workspace[:updated_at]})
    end
  end

  it 'get workspace info' do
    VCR.use_cassette("workspaces/get_workspace_info", :record => :none) do
      get_workspace_info = client.get_workspace_info id: 5933

      expect(get_workspace_info).to eq({:id=>5933, :name=>"api_workspacex3",
                                      :team_id=>183,
                                      :created_at=>get_workspace_info[:created_at],
                                      :updated_at=>get_workspace_info[:updated_at]})
    end
  end

  it 'update workspace info' do
    VCR.use_cassette("workspaces/update_workspace_info", :record => :none) do
      update_workspace_info = client.update_workspace_info id: 5933, workspace:
                                      {name: "api_workspacex3_update"}

      expect(update_workspace_info).to eq({:id=>5933, :name=>"api_workspacex3_update",
                                      :team_id=>183,
                                      :created_at=>update_workspace_info[:created_at],
                                      :updated_at=>update_workspace_info[:updated_at]})
    end
  end
end
