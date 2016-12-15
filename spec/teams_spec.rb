require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["ORG_KEY"], api_scheme: 'https' }

  it 'create team' do
    VCR.use_cassette("teams/create_team", :record => :none) do
      create_team = client.create_team team: { name: 'api_team',
                               allowed_workspaces: 5, allowed_admins: 5,
                               drm_enabled: false, watermarking: true,
                               suppress_emails: true }

      expect(create_team).to eq({:id=>183, :name=>"api_team", :team_owner_id=>92,
                                 :creator_id=>92, :allowed_workspaces=>5,
                                 :allowed_admins=>5, :drm_enabled=>false,
                                 :watermarking=>true, :suppress_emails=>true})
    end
  end

  it 'get team info' do
    VCR.use_cassette("teams/get_team_info", :record => :none) do
      get_team_info = client.get_team_info id: 183

      expect(get_team_info).to eq({:id=>183, :name=>"api_team", :team_owner_id=>92,
                                 :creator_id=>92, :allowed_workspaces=>5,
                                 :allowed_admins=>5, :drm_enabled=>false,
                                 :watermarking=>true, :suppress_emails=>true})
    end
  end


  it 'update team' do
    VCR.use_cassette("teams/update_team", :record => :none) do
      update_team = client.update_team_info id: 183, team: { name: 'api_team_x4',
                               allowed_workspaces: 10, allowed_admins: 10,
                               drm_enabled: false, watermarking: true,
                               suppress_emails: true }

      expect(update_team).to eq({:id=>183, :name=>"api_team_x4", :team_owner_id=>92,
                                 :creator_id=>92, :allowed_workspaces=>10,
                                 :allowed_admins=>10, :drm_enabled=>false,
                                 :watermarking=>true, :suppress_emails=>true})
    end
  end

  it 'add team member' do
    VCR.use_cassette("teams/add_team_member", :record => :none) do
      add_team_member = client.add_team_member id: 183, user_id: 101

      expect(add_team_member).to include({user: {"id"=>101, "first_name"=>"John",
                                        "last_name"=>"Smith",
                                        "email"=>"john_smith@example.com",
                                        "time_zone"=>"Pacific Time (US & Canada)",
                                        "jti"=>nil},
                                        :created_at=>add_team_member[:created_at],
                                        :updated_at=>add_team_member[:updated_at]})
    end
  end

  it 'remove team member' do
    VCR.use_cassette("teams/remove_team_member", :record => :none) do
      remove_team_member = client.remove_team_member id: 183, user_id: 101

      expect(remove_team_member).to eq({:status=>200,
                          :message=>"User with ID: 101 was removed from team."})
    end
  end

  xit 'show team member' do
    VCR.use_cassette("teams/show_team_members", :record => :none) do
      get_list_of_team_members = client.get_list_of_team_members id: 183

      expect(get_list_of_team_members).to eq([{"user"=>{"id"=>92,
                                "first_name"=>"Jazz_org", "last_name"=>"Admin",
                                "email"=>"api+jazz_org@caplinked.com",
                                "time_zone"=>"Pacific Time (US & Canada)",
                                "jti"=>nil},
                                "created_at"=>"2016-12-05T10:15:21.740-08:00",
                                "updated_at"=>"2016-12-05T10:15:21.817-08:00"}])
    end
  end
end
