require 'spec_helper'

RSpec.describe "Utils", :type => :utils do
  client = Caplinked::Client.new api_key: "API_KEYS", api_host: 'sandbox.caplinked.com', api_scheme: 'https'

  it "perform get" do
    stub_request(:get, "https://sandbox.caplinked.com/api/v1/activities/workspace/5886").
      with(:headers => {'Connection'=>'close', 'Host'=>'sandbox.caplinked.com',
        'User-Agent'=>'http.rb/2.1.0', 'X-Token'=>"API_KEYS"}).
      to_return(:status => 200, body: fixture('get.json'),
        headers: { content_type: 'application/json; charset=utf-8' })

    get = client.perform_get("/api/v1/activities/workspace/5886", {})

    expect(get[:pagination]).to include({"total_pages"=>2, "page"=>1, "per_page"=>100})
    expect(get[:events].count).to eq(100)
  end

  it "perform delete" do
    stub_request(:delete, "https://sandbox.caplinked.com/api/v1/folders/37128?workspace_id=5886").
      with(:headers => {'Connection'=>'close', 'Host'=>'sandbox.caplinked.com',
        'User-Agent'=>'http.rb/2.1.0', 'X-Token'=>"API_KEYS"}).
      to_return(:status => 200, body: fixture('delete.json'),
        headers: { content_type: 'application/json; charset=utf-8' })

    delete = client.perform_delete("/api/v1/folders/37128", {"workspace_id"=>5886})

    expect(delete).to eq({:id=>37128, :deleted=>true})
  end

  it "perform put" do
    stub_request(:put, "https://sandbox.caplinked.com/api/v1/teams/183").
      with(:body => "{\"team\":{\"name\":\"api_team_x5\"}}",
        :headers => {'Connection'=>'close', 'Content-Type'=>'application/json',
        'Host'=>'sandbox.caplinked.com', 'User-Agent'=>'http.rb/2.1.0',
        'X-Token'=>"API_KEYS"}).
      to_return(:status => 200, body: fixture('put.json'),
          headers: { content_type: 'application/json; charset=utf-8' })

      client = Caplinked::Client.new api_key: "API_KEYS",
        api_host: 'sandbox.caplinked.com', api_scheme: 'https'

      put = client.perform_put("/api/v1/teams/183", {},
        "{\"team\":{\"name\":\"api_team_x5\"}}", {"Content-Type"=>"application/json"})

      expect(put[:name]).to eq("api_team_x5")
  end

  it "perform post" do
    stub_request(:post, "https://sandbox.caplinked.com/api/v1/teams").
      with(:body => "{\"team\":{\"name\":\"api_teamx7\"}}",
        :headers => {'Connection'=>'close', 'Content-Type'=>'application/json',
        'Host'=>'sandbox.caplinked.com', 'User-Agent'=>'http.rb/2.1.0',
        'X-Token'=>"API_KEYS"}).
      to_return(:status => 200, body: fixture('post.json'),
          headers: { content_type: 'application/json; charset=utf-8' })

      client = Caplinked::Client.new api_key: "API_KEYS", api_host: 'sandbox.caplinked.com', api_scheme: 'https'

      post = client.perform_post("/api/v1/teams", {},
      "{\"team\":{\"name\":\"api_teamx7\"}}", {"Content-Type"=>"application/json"})

      expect(post[:name]).to eq("api_teamx7")
  end

  it "perform put_with_binary_data" do
    stub_request(:put, "https://sandbox.caplinked.com/api/v1/files/upload?file_name=pg_0317.pdf&folder_id=32277&workspace_id=5886").
      with(:body => File.join(File.dirname(__FILE__), "/files/pg_0317.pdf"),
        :headers => {'Connection'=>'close', 'Host'=>'sandbox.caplinked.com',
        'User-Agent'=>'http.rb/2.1.0', 'X-Token'=>"API_KEYS"}).
      to_return(:status => 200, body: fixture('put_with_binary.json'),
          headers: { content_type: 'application/json; charset=utf-8' })

      put_with_binary = client.perform_put_with_binary_data("/api/v1/files/upload",
      {"workspace_id"=>5886, "folder_id"=>32277, "file_name"=>"pg_0317.pdf"},
      File.join(File.dirname(__FILE__), "/files/pg_0317.pdf"))

      expect(put_with_binary[:file_name]).to eq('pg_0317.pdf')
  end

  it "get error check" do
    stub_request(:get, "https://sandbox.caplinked.com/api/v1/activities/workspace/5886").
      with(:headers => {'Connection'=>'close', 'Host'=>'sandbox.caplinked.com',
        'User-Agent'=>'http.rb/2.1.0', 'X-Token'=>"API_KEYS"}).
      to_return(:status => 200, body: fixture('user_not_found.json'),
        headers: { content_type: 'application/json; charset=utf-8' })

    expect{client.perform_get("/api/v1/activities/workspace/5886?user_id=2233", {})}.to raise_error(StandardError)
  end

end
