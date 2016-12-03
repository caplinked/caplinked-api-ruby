require 'spec_helper'

describe Caplinked::Client, :vcr => true do

  it 'create user' do
    VCR.use_cassette("users/create_user") do
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

  it 'create user' do
    VCR.use_cassette("users/create_user") do
      client = Caplinked::Client.new api_key: ENV["USER_12"], api_scheme: 'https'
      create_user = client.create_user user: { email: 'api+user+12@caplinked.com',
                                 first_name: 'api', last_name: 'user+12',
                                 time_zone: "Pacific Time (US & Canada)" }

      expect(create_user).to eq({:id=>103, :first_name=>"Api", :last_name=>"User+12",
                                 :email=>"api+user+12@caplinked.com",
                                 :time_zone=>"Pacific Time (US & Canada)",
                                 :jti=>""})
    end
  end

  USER_12
end
