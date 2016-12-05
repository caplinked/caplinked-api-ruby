require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'get organization info' do
    VCR.use_cassette("permissions/get_folder_permissions", :record => :none) do
      get_folder_permissions = client.get_folder_permissions id: 32339,
                                workspace_id: 5886, group_id: 26403

      expect(get_folder_permissions).to eq([{"id"=>"36885",
                                            "id_tree"=>"0.32339.36885",
                                            "name"=>"New folder", "view"=>true,
                                            "download"=>true, "upload"=>false,
                                            "position"=>"1", "index"=>"1.1",
                                            "is_mixed_view"=>false,
                                            "is_mixed_download"=>false,
                                            "is_mixed_upload"=>false}])
    end
  end

  it 'get organization info' do
    VCR.use_cassette("permissions/update_folder_permissions", :record => :none) do
      update_folder_permissions = client.update_folder_permissions id: 32339,
                                workspace_id: 5886, group_id: 26403,
                                verb: 'revoke', folder_action: 'download'

      expect(update_folder_permissions).to eq({
                            :created_at=>update_folder_permissions[:created_at],
                            :updated_at=>update_folder_permissions[:updated_at],
                            :message=>"revoked download access to spec update for group: new_group"})
    end
  end
end
