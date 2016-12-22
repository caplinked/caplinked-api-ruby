require 'spec_helper'

RSpec.describe "Client", :type => :client do

  it "confirm default value initialize" do
    client = Caplinked::Client.new

    expect(client.api_host).to eq("sandbox.caplinked.com")
    expect(client.api_scheme).to eq("https")
  end

  it "passing new values" do
    client = Caplinked::Client.new api_key: ENV["API_KEY"], api_host: 'secure.caplinked.com', api_scheme: 'https'

    expect(client.api_host).to eq("secure.caplinked.com")
    expect(client.api_scheme).to eq("https")
    expect(client.api_key).to eq(ENV["API_KEY"])
  end
end
