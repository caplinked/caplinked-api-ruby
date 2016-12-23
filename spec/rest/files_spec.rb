require 'spec_helper'

describe Caplinked::Client, :vcr => true do
  let!(:client) { Caplinked::Client.new api_key: ENV["API_KEY"], api_scheme: 'https' }

  it 'Upload a File' do
    VCR.use_cassette("files/upload_file", :record => :none) do
      new_file = client.upload_file workspace_id: 5886, folder_id: 32277, file_name: 'pg_0317.pdf', file: File.join(File.dirname(__FILE__), "/files/pg_0317.pdf")

      expect(new_file[:file_name]).to eq("pg_0317.pdf")
    end
  end

  xit 'Returns file info' do
    VCR.use_cassette("files/file_info", :record => :none) do
      file_info = client.get_file_info id: 38187, workspace_id: 5886

      expect(file_info[:id]).to eq(38187)
    end
  end

  it 'Deletes file' do
    VCR.use_cassette("files/delete_file", :record => :none) do
      delete_file = client.delete_file workspace_id: 5886, id: 37639

      expect(delete_file[:id]).to eq(37639)
      expect(delete_file[:deleted]).to eq(true)
    end
  end

  it 'Update file info' do
    VCR.use_cassette("files/update_file_info", :record => :none, :record => :none) do
      update_file = client.update_file_info workspace_id: 5886, id: 45906, file: { title: 'api_update', index: 1 }

      expect(update_file[:title]).to eq('api_update.pdf')
      expect(update_file[:index]).to eq(1)
    end
  end

  it 'Copy File:' do
    VCR.use_cassette("files/copy_file", :record => :none) do
      copy_file = client.copy_file id: 38187, workspace_id: 5886, destination_folder_id: 37109

      expect(copy_file).to eq({"id":46515,"title":"pg_0306.pdf",
                                    "file_name":"pg_0306.pdf","file_size":"106396",
                                    "file_content_type":"application/pdf","index":1,
                                    "created_at": copy_file[:created_at],
                                    "updated_at": copy_file[:updated_at]})
    end
  end

  it 'Move File:' do
    VCR.use_cassette("files/move_file", :record => :none) do
      move_file = client.move_file id: 45907, workspace_id: 5886, destination_folder_id: 37106

      expect(move_file[:id]).to eq(45907)
    end
  end

end
