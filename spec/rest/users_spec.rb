require 'spec_helper'

describe Caplinked::Client, :vcr => true do

  it 'create user' do
    VCR.use_cassette("users/create_user", :record => :none) do
      client = Caplinked::Client.new api_key: ENV["ORG_KEY"], api_scheme: 'https'
      create_user = client.create_user user: { email: 'api+user+12@caplinked.com',
                                 first_name: 'api', last_name: 'user+12',
                                 time_zone: "Pacific Time (US & Canada)" }

      expect(create_user).to eq({:id=>103, :first_name=>"Api", :last_name=>"User+12",
                                 :email=>"api+user+12@caplinked.com",
                                 :time_zone=>"Pacific Time (US & Canada)",
                                 :jti=>""})
    end
  end

  it 'get user' do
    VCR.use_cassette("users/get_user_info", :record => :none) do
      client = Caplinked::Client.new api_key: ENV["USER_KEY"], api_scheme: 'https'
      get_user_info = client.get_user_info

      expect(get_user_info).to eq({:id=>103, :first_name=>"Api",
                                   :last_name=>"User+12",
                                   :email=>"api+user+12@caplinked.com",
                                   :time_zone=>"Pacific Time (US & Canada)",
                                   :jti=>nil})
    end
  end

  it 'update user' do
    VCR.use_cassette("users/update_user_info", :record => :none) do
      client = Caplinked::Client.new api_key: ENV["USER_KEY"], api_scheme: 'https'
      update_user = client.update_user user: { email: 'user+12@caplinked.com'}

      expect(update_user).to eq({:id=>103, :first_name=>"Api",
                                   :last_name=>"User+12",
                                   :email=>"user+12@caplinked.com",
                                   :time_zone=>"Pacific Time (US & Canada)",
                                   :jti=>nil})
    end
  end
end
