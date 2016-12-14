require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'create a folder' do
    VCR.use_cassette("folder/create_a_folder", :record => :none) do
      create_a_new_folder = client.create_a_new_folder workspace_id: 5886,
                                          parent_id: 32277, name: 'spec_folder'

      expect(create_a_new_folder).to eq({:id=>37108, :name=>create_a_new_folder[:name],
              :path=>nil, :owner_type=>"Workspace", :owner_id=>5886,
              :created_at=>create_a_new_folder[:created_at],
              :updated_at=>create_a_new_folder[:updated_at],
              :index=>create_a_new_folder[:index], :last_updated_user_id=>2, :parent_path=>"/",
              :parent_id=>32277, :id_tree=>"32277.37108"})
    end
  end

  it 'delete folder' do
    VCR.use_cassette("folder/delete_folder", :record => :none) do
      delete_folder = client.delete_folder workspace_id: 5886, id: 37108

      expect(delete_folder).to eq({:id=>37108, :deleted=>true})
    end
  end

  it 'get folder info' do
    VCR.use_cassette("folder/get_folder_info", :record => :none) do
      get_folder_info = client.get_folder_info workspace_id: 5886, id: 32339

      expect(get_folder_info).to include(:folder)
      expect(get_folder_info).to include(:immediate_subfolders)
      expect(get_folder_info[:folder]).to eq({"id"=>32339, "name"=>"Folder 2",
                              "path"=>nil, "owner_type"=>"Workspace",
                              "owner_id"=>5886,
                              "created_at"=>get_folder_info[:folder]["created_at"],
                              "updated_at"=>get_folder_info[:folder]["updated_at"],
                              "index"=>2, "last_updated_user_id"=>99,
                              "parent_path"=>"/", "parent_id"=>0,
                              "id_tree"=>"32339"})
    end
  end

  it 'update folder info' do
    VCR.use_cassette("folder/update_folder_info", :record => :none) do
      update_folder_info = client.update_folder_info id: 32339,
                workspace_id: 5886, folder: { name: 'spec update', index: 1}

      expect(update_folder_info).to eq({:id=>32339, :name=>"spec update",
                                    :path=>nil, :owner_type=>"Workspace",
                                    :owner_id=>5886,
                                    :created_at=>update_folder_info[:created_at],
                                    :updated_at=>update_folder_info[:updated_at],
                                    :index=>1, :last_updated_user_id=>99,
                                    :parent_path=>"/", :parent_id=>0,
                                    :id_tree=>"32339"})
    end
  end

  it 'copy folder' do
    VCR.use_cassette("folder/copy_folder", :record => :none) do
      copy_folder = client.copy_folder id: 37109,
                workspace_id: 5886, destination_folder_id: 37106

      expect(copy_folder).to eq({:id=>37111,
                                 :name=>"copy_me_1",
                                 :path=>nil,
                                 :owner_type=>"Workspace",
                                 :owner_id=>5886,
                                 :created_at=>copy_folder[:created_at],
                                 :updated_at=>copy_folder[:updated_at],
                                 :index=>1,
                                 :last_updated_user_id=>nil,
                                 :parent_path=>"/",
                                 :parent_id=>37106,
                                 :id_tree=>"37106.37111"})
    end
  end

  it 'move folder' do
    VCR.use_cassette("folder/move_folder", :record => :none) do
      move_folder = client.move_folder id: 37110,
                workspace_id: 5886, destination_folder_id: 37107

      expect(move_folder).to eq({:id=>37110,
                                 :name=>"Move_me_1",
                                 :path=>nil,
                                 :owner_type=>"Workspace",
                                 :owner_id=>5886,
                                 :created_at=>move_folder[:created_at],
                                 :updated_at=>move_folder[:updated_at],
                                 :index=>1,
                                 :last_updated_user_id=>2,
                                 :parent_path=>"/",
                                 :parent_id=>37107,
                                 :id_tree=>"37107.37110"})
    end
  end
end
