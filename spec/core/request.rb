require 'spec_helper'

RSpec.describe "Request", :type => :request do
  client = Caplinked::Client.new api_key: ENV["API_KEY"], api_host: 'sandbox.caplinked.com', api_scheme: 'https'

  it "execute init" do
    request = Caplinked::Request.new(client, :get, "/api/v1/activities/workspace/5886", {:params=>{}})

    expect(request.client.api_host).to eq("sandbox.caplinked.com")
    expect(request.path).to eq("/api/v1/activities/workspace/5886")
    expect(request.request_method).to eq(:get)
  end

  it "perform request" do
    VCR.use_cassette("request/file_info") do
      request = Caplinked::Request.new(client, :get, "/api/v1/files/38187", {:params=>{"workspace_id"=>5886}}).perform

      expect(request[:id]).to eq(38187)
      expect(request[:title]).to eq("pg_0306.pdf")
      expect(request[:index]).to eq(1)
      expect(request[:viewer_image]["status"]).to eq("Ready")
    end
  end
end
