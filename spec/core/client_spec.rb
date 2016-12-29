require 'spec_helper'

RSpec.describe "Client", :type => :client do

  it "confirm default value initialize" do
    client = Caplinked::Client.new

    expect(client.api_host).to eq("sandbox.caplinked.com")
    expect(client.api_scheme).to eq("https")
  end

  it "passing new values" do
    client = Caplinked::Client.new api_key: "API_KEY", api_host: 'secure.caplinked.com', api_scheme: 'http'

    expect(client.api_host).to eq("secure.caplinked.com")
    expect(client.api_scheme).to eq("http")
    expect(client.api_key).to eq("API_KEY")
  end
end
