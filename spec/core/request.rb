require 'spec_helper'

RSpec.describe "Request", :type => :request do
  client = Caplinked::Client.new api_key: ENV["API_KEY"], api_host: 'sandbox.caplinked.com', api_scheme: 'https'

  it "execute init" do
    stub_request(:get, "https://sandbox.caplinked.com/api/v1/files/38187?workspace_id=5886").
      with(headers: {'Connection'=>'close', 'Host'=>'sandbox.caplinked.com', 'User-Agent'=>'http.rb/2.1.0', 'X-Token'=>ENV["API_KEY"]}).
      to_return(status: 200, body: fixture('activities_workspace.json'), headers: { content_type: 'application/json; charset=utf-8' })

    request = Caplinked::Request.new(client, :get, "/api/v1/activities/workspace/5886", {:params=>{}})

    expect(request.client.api_host).to eq("sandbox.caplinked.com")
    expect(request.path).to eq("/api/v1/activities/workspace/5886")
    expect(request.request_method).to eq(:get)
  end

  it "perform request" do
    stub_request(:get, "https://sandbox.caplinked.com/api/v1/files/38187?workspace_id=5886").
      with(:headers => {'Connection'=>'close', 'Host'=>'sandbox.caplinked.com', 'User-Agent'=>'http.rb/2.1.0', 'X-Token'=>ENV["API_KEY"]}).
      to_return(status: 200, body: fixture('files_get_files.json'), headers: { content_type: 'application/json; charset=utf-8' })

    request = Caplinked::Request.new(client, :get, "/api/v1/files/38187", {:params=>{"workspace_id"=>5886}}).perform

    expect(request[:id]).to eq(38187)
    expect(request[:title]).to eq("pg_0306.pdf")
    expect(request[:index]).to eq(1)
    expect(request[:viewer_image]["status"]).to eq("Ready")
  end
end
