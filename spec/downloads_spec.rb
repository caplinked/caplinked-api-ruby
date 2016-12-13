require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'create a zip file' do
    VCR.use_cassette("downloads/folder_downloads", :record => :none) do

      create_zip_file = client.create_zip_file workspace_id: 5886, download: { folder_ids: [32277,32339] }

      expect(create_zip_file).to eq({:id=>create_zip_file[:id], :user_id=>2,
          :file_ids=>[], :folder_ids=>[32277,32339], :status=>"building_directory",
          :created_at=>create_zip_file[:created_at]})
    end
  end

  it 'download single file' do
    VCR.use_cassette("downloads/download_single_file", :record => :none) do
      single_file_download = client.single_file_download file_id: 45907, workspace_id: 5886

      expect(single_file_download).to eq({:expiring_url=>"expiring_url", :file_name=>"api_update.pdf"})
    end
  end

  it 'download status' do
    VCR.use_cassette("downloads/download_status", :record => :none) do

      download_status = client.download_status workspace_id: 5886

      expect(download_status.first).to eq({"id"=>download_status.first['id'], "user_id"=>2, "file_ids"=>[], "folder_ids"=>[32277, 32339], "status"=>"done", "created_at"=>download_status.first['created_at']})
    end
  end

  it 'delete download' do
    VCR.use_cassette("downloads/delete_download", :record => :none) do

      delete_download = client.delete_download id: 713, workspace_id: 5886

      expect(delete_download).to eq({:id=>delete_download[:id], :status=>200})
    end
  end

  it 'get zip' do
    VCR.use_cassette("downloads/get_zip", :record => :none) do

      get_zip = client.get_zip id: 731, workspace_id: 5886
      expect(get_zip).to eq({:expiring_url=>"expiring_url", :file_name=>"Multiple_Selections.zip"})
    end
  end

end
