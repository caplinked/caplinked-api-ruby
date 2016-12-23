require 'spec_helper'

RSpec.describe "Utils", :type => :utils do
  client = Caplinked::Client.new api_key: ENV["API_KEY"], api_host: 'sandbox.caplinked.com', api_scheme: 'https'

  it "perform get" do
    VCR.use_cassette("utils/get", :record => :none) do
      get = client.perform_get("/api/v1/activities/workspace/5886", {})

      expect(get[:pagination]).to include({"total_pages"=>2,
                                          "page"=>1, "per_page"=>100})
      expect(get[:events].count).to eq(100)
    end
  end

  it "perform delete" do
    VCR.use_cassette("utils/delete", :record => :none) do
      delete = client.perform_delete("/api/v1/folders/37128", {"workspace_id"=>5886})

      expect(delete).to eq({:id=>37128, :deleted=>true})
    end

  end

  it "perform put" do
    VCR.use_cassette("utils/put", :record => :none) do
      client = Caplinked::Client.new api_key: ENV["ORG_KEY"], api_host: 'sandbox.caplinked.com', api_scheme: 'https'

      put = client.perform_put("/api/v1/teams/183", {},
      "{\"team\":{\"name\":\"api_team_x5\"}}", {"Content-Type"=>"application/json"})

      expect(put[:name]).to eq("api_team_x5")
    end

  end

  it "perform post" do
    VCR.use_cassette("utils/post", :record => :none) do
      client = Caplinked::Client.new api_key: ENV["ORG_KEY"], api_host: 'sandbox.caplinked.com', api_scheme: 'https'

      post = client.perform_post("/api/v1/teams", {},
      "{\"team\":{\"name\":\"api_teamx7\"}}", {"Content-Type"=>"application/json"})

      expect(post[:name]).to eq("api_teamx7")
    end
  end

  it "perform put_with_binary_data" do
    VCR.use_cassette("utils/put_with_binary", :record => :none) do

      put_with_binary = client.perform_put_with_binary_data("/api/v1/files/upload",
      {"workspace_id"=>5886, "folder_id"=>32277, "file_name"=>"pg_0317.pdf"},
      File.join(File.dirname(__FILE__), "/files/pg_0317.pdf"))

      expect(put_with_binary[:file_name]).to eq('pg_0317.pdf')
    end
  end

end
