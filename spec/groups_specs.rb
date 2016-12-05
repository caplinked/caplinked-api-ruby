require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'list all groups in workspace' do
    VCR.use_cassette("groups/list_all_groups_in_workspace") do
      list_all_groups_in_workspace = client.list_all_groups_in_workspace workspace_id: 5886

      expect(list_all_groups_in_workspace).to eq([{"id"=>26403, "name"=>"new_group",
            "workspace_id"=>5886, "drm_enabled"=>false, "drm_expires_after"=>nil,
            "expire_workspace_access"=>false, "expire_workspace_access_at"=>nil,
            "watermarked"=>false, "file_managing_abilities"=>nil},
            {"id"=>26125, "name"=>"Workspace Admins", "workspace_id"=>5886,
            "drm_enabled"=>false, "drm_expires_after"=>nil,
            "expire_workspace_access"=>false, "expire_workspace_access_at"=>nil,
            "watermarked"=>false, "file_managing_abilities"=>nil},
            {"id"=>26124, "name"=>"Team Admins", "workspace_id"=>5886,
            "drm_enabled"=>false, "drm_expires_after"=>nil,
            "expire_workspace_access"=>false, "expire_workspace_access_at"=>nil,
            "watermarked"=>false, "file_managing_abilities"=>nil},
            {"id"=>26123, "name"=>"All Members", "workspace_id"=>5886,
            "drm_enabled"=>false, "drm_expires_after"=>nil,
            "expire_workspace_access"=>false, "expire_workspace_access_at"=>nil,
            "watermarked"=>false, "file_managing_abilities"=>nil}])
    end
  end

  it 'create group' do
    VCR.use_cassette("groups/create_group") do
      create_group = client.create_group group: {name: 'api_group',
                      workspace_id: 5886, file_managing_abilities: false}

      expect(create_group).to eq({:id=>26407, :name=>"api_group",
            :workspace_id=>5886, :drm_enabled=>false, :drm_expires_after=>nil,
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>false, :file_managing_abilities=>false})
    end
  end

  it 'get group info' do
    VCR.use_cassette("groups/get_group_info") do
      get_group_info = client.get_group_info id: 26407, workspace_id: 5886

      expect(get_group_info).to eq({:id=>26407, :name=>"api_group_updated",
            :workspace_id=>5886, :drm_enabled=>false, :drm_expires_after=>nil,
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>false, :file_managing_abilities=>true})
    end
  end

  it 'update group' do
    VCR.use_cassette("groups/update_group") do
      update_group = client.update_group id: 26407, workspace_id: 5886,
            group: {name: 'api_group_updated', file_managing_abilities: true}

      expect(update_group).to eq({:id=>26407, :name=>"api_group_updated",
            :workspace_id=>5886, :drm_enabled=>false, :drm_expires_after=>nil,
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>false, :file_managing_abilities=>true})
    end
  end

  it 'delete group' do
    VCR.use_cassette("groups/delete_group") do
      delete_group = client.delete_group id: 26407, workspace_id: 5886

      expect(delete_group).to eq({"id":26407,"name":"api_group_updated"})
    end
  end

  it 'update group drm' do
    VCR.use_cassette("groups/update_group_drm") do
      update_group_drm = client.update_group_drm id: 26403, workspace_id: 5886,
            group: {drm_enabled: true, drm_expires_after: '2017-03-03'}

      expect(update_group_drm).to eq({:id=>26403, :name=>"new_group",
            :workspace_id=>5886, :drm_enabled=>true, :drm_expires_after=>'2017-03-03',
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>false, :file_managing_abilities=>false})
    end
  end

  it 'update group drm' do
    VCR.use_cassette("groups/update_group_drm") do
      update_group_drm = client.update_group_drm id: 26403, workspace_id: 5886,
            group: {drm_enabled: true, drm_expires_after: '2017-03-03'}

      expect(update_group_drm).to eq({:id=>26403, :name=>"new_group",
            :workspace_id=>5886, :drm_enabled=>true, :drm_expires_after=>'2017-03-03',
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>false, :file_managing_abilities=>false})
    end
  end

  it 'disable drm expiration' do
    VCR.use_cassette("groups/disable_drm_expiration") do
      disable_drm_expiration = client.disable_drm_expiration id: 26403, workspace_id: 5886

      expect(disable_drm_expiration).to eq({:id=>26403, :name=>"new_group",
            :workspace_id=>5886, :drm_enabled=>true, :drm_expires_after=>nil,
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>false, :file_managing_abilities=>false})
    end
  end

  it 'watermarking for group' do
    VCR.use_cassette("groups/watermarking_for_group") do
      watermarking_for_group = client.watermarking_for_group id: 26403, workspace_id: 5886,
            group: {watermarking: true}

      expect(watermarking_for_group).to eq({:id=>26403, :name=>"new_group",
            :workspace_id=>5886, :drm_enabled=>true, :drm_expires_after=>nil,
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>true, :file_managing_abilities=>false})
    end
  end

  it 'enable access expiration' do
    VCR.use_cassette("groups/enable_access_expiration") do
      enable_access_expiration = client.enable_access_expiration id: 26403, workspace_id: 5886,
            group: {expire_workspace_access_at: "2017-03-03"}

      expect(enable_access_expiration).to eq({:id=>26403, :name=>"new_group",
            :workspace_id=>5886, :drm_enabled=>true, :drm_expires_after=>nil,
            :expire_workspace_access=>true, :expire_workspace_access_at=>"2017-03-03",
            :watermarked=>true, :file_managing_abilities=>false})
    end
  end

  it 'disable access expiration' do
    VCR.use_cassette("groups/disable_access_expiration") do
      disable_access_expiration = client.disable_access_expiration id: 26403, workspace_id: 5886

      expect(disable_access_expiration).to eq({:id=>26403, :name=>"new_group",
            :workspace_id=>5886, :drm_enabled=>true, :drm_expires_after=>nil,
            :expire_workspace_access=>false, :expire_workspace_access_at=>nil,
            :watermarked=>true, :file_managing_abilities=>false})
    end
  end

  it 'add group member' do
    VCR.use_cassette("groups/add_group_member") do
      add_group_member = client.add_group_member id: 26403, user_id: 101,
                         workspace_id: 5886, send_email: false

      expect(add_group_member).to eq({:id=>36646, :group_id=>26403, :user_id=>101})
    end
  end

  it 'remove group member' do
    VCR.use_cassette("groups/remove_group_member") do
      remove_group_member = client.remove_group_member id: 26403, user_id: 101,
                            workspace_id: 5886

      expect(remove_group_member).to eq({:status_code=>200})
    end
  end

  it 'show group member' do
    VCR.use_cassette("groups/list_all_group_members") do
      list_all_group_members = client.list_all_group_members id: 26403,
                               workspace_id: 5886

      expect(list_all_group_members).to eq([{"id"=>3, "first_name"=>"Brandon",
                                            "last_name"=>"Brown",
                                            "email"=>"bbrown@caplinked.com",
                                            "time_zone"=>"Pacific Time (US & Canada)",
                                            "jti"=>nil}])
    end
  end
end
