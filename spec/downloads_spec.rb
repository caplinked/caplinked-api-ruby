require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'create a zip file' do
    VCR.use_cassette("downloads/folder_downloads") do

      create_zip_file = client.create_zip_file workspace_id: 5886, download: { folder_ids: [32277,32339] }

      expect(create_zip_file).to eq({:id=>create_zip_file[:id], :user_id=>2,
          :file_ids=>[], :folder_ids=>[32277,32339], :status=>"building_directory",
          :created_at=>create_zip_file[:created_at]})
    end
  end

  xit 'download single file' do
    VCR.use_cassette("downloads/download_single_file") do

      single_file_download = client.single_file_download file_id: 45907, workspace_id: 5886

      #returns file
      #HTTP::Error: Unknown MIME type:
      expect(single_file_download).to eq()
    end
  end

  it 'download single file' do
    VCR.use_cassette("downloads/download_status") do

      download_status = client.download_status workspace_id: 5886

      expect(download_status.first).to eq({"id"=>download_status.first['id'], "user_id"=>2, "file_ids"=>[], "folder_ids"=>[32277, 32339], "status"=>"done", "created_at"=>download_status.first['created_at']})
    end
  end

  it 'download single file' do
    VCR.use_cassette("downloads/delete_download") do

      delete_download = client.delete_download id: 713, workspace_id: 5886

      expect(delete_download).to eq({:id=>delete_download[:id], :status=>200})
    end
  end

  xit 'get zip' do
    VCR.use_cassette("downloads/get_zip") do

      get_zip = client.get_zip id: 714, workspace_id: 5886

      #returns zip
      #HTTP::Error: Unknown MIME type:
      expect(get_zip).to eq()
    end
  end

end
