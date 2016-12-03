require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["ORG_KEY"], api_scheme: 'https' }

  it 'get organization info' do
    VCR.use_cassette("organizations/get_organization_info") do
      get_organization_info = client.get_organization_info id: 4639

      expect(get_organization_info).to eq({:id=>4639, :name=>"Jazz_org",
                                           :description=>"", :location=>"",
                                           :billing_email=>"", :url=>nil,
                                           :support_number=>"(888) 799-6849",
                                           :support_email=>"support@caplinked.com",
                                           :support_website=>"http://support.caplinked.com",
                                           :created_at=>get_organization_info[:created_at],
                                           :updated_at=>get_organization_info[:updated_at]})
    end
  end

  it 'update organization info' do
    VCR.use_cassette("organizations/update_organization_info") do
      update_organization_info = client.update_organization_info id: 4639, name: 'jazz update',
      description: 'jazz org', location: 'Los Angeles', billing_email: 'jazz@billing.com',
      url: 'www.jazzbilling.com'

      expect(update_organization_info).to eq({:id=>4639, :name=>"jazz update",
                                           :description=>"jazz org",
                                           :location=>"Los Angeles",
                                           :billing_email=>"jazz@billing.com",
                                           :url=>'www.jazzbilling.com',
                                           :support_number=>"(888) 799-6849",
                                           :support_email=>"support@caplinked.com",
                                           :support_website=>"http://support.caplinked.com",
                                           :created_at=>update_organization_info[:created_at],
                                           :updated_at=>update_organization_info[:updated_at]})
    end
  end

  it 'update organization info' do
    VCR.use_cassette("organizations/update_organization_support_info") do
      update_organization_support_info = client.update_organization_support_info id: 4639,
      email: 'jazz@update.com', phone_number: '88374', website: 'www.jazzbilling.com'

      expect(update_organization_support_info).to include({:support_number=>"88374",
                                           :support_email=>"jazz@update.com",
                                           :support_website=>"www.jazzbilling.com",
                                           :created_at=>update_organization_support_info[:created_at],
                                           :updated_at=>update_organization_support_info[:updated_at]})
    end
  end

  it 'add organization member' do
    VCR.use_cassette("organizations/add_organization_member") do
      add_organization_member = client.add_organization_member id: 4639, user_id: 101

      expect(add_organization_member).to include({:id=>118, :organization_id=>4639,
                  :user_id=>101, :created_at=>add_organization_member[:created_at]})
    end
  end

  it 'remove organization member' do
    VCR.use_cassette("organizations/remove_organization_member") do
      remove_organization_member = client.remove_organization_member id: 4639, user_id: 101

      expect(remove_organization_member).to eq({:status_code=>200})
    end
  end

  it 'show organization member' do
    VCR.use_cassette("organizations/show_organization_members") do
      show_organization_members = client.show_organization_members id: 4639

      expect(show_organization_members).to eq([{"id"=>92, "first_name"=>"Jazz_org",
                    "last_name"=>"Admin", "email"=>"api+jazz_org@caplinked.com",
                    "time_zone"=>"Pacific Time (US & Canada)", "jti"=>nil}])
    end
  end
end
