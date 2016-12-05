# caplinked-api-ruby

Ruby SDK for Caplinked's API  
Documentation at https://developer.caplinked.com/docs

## Quick start guide:

Add Rubygem to Bundle:

```
gem 'caplinked-api-ruby'
```
## Activities:

Get Workspace Activities:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
get_workspace_activities = client.client.get_workspace_activities workspace_id: 1, user_id: user[:id]
```

## Downloads:

Create a zip file

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
create_zip_file = client.create_zip_file workspace_id: 1, download: { folder_ids: [folder[:id], folder[:id]] }
```

Download a single file

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
single_file_download = client.single_file_download file_id: file_info[:id], workspace_id: 1
```

Download status

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
download_status = client.download_status workspace_id: 1
```

Delete download

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
delete_download = client.delete_download id: download[:id], workspace_id: 1
```

Get zip

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
get_zip = client.get_zip id: download[:id], workspace_id: 1
```

## Files:

Upload a File:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
new_file = client.upload_file workspace_id: 1, folder_id: 1, file_name: 'test_photo.jpg', file: File.read('/your/local/test_photo.jpg')
```

Get File info:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
file_info = client.get_file_info id: new_file[:id], workspace_id: 1
```

Get File viewer:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
file_viewer = client.get_file_viewer id: file_info[:id], workspace_id: 1, expiring_token: file_info[:viewer]['expiring_tokens']['normal']
```

Delete File:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
delete_file = client.delete_file workspace_id: 1, id: file_info[:id]
```

Update File info:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
update_file = client.update_file_info workspace_id: 1, id: file_info[:id], 'file[title]': 'name', 'file[index]': file[:index]
```

Copy File:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
copy_file = client.copy_file id: file_info[:id], workspace_id: 1, destination_folder_id: folder[:id]
```

Move File:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
move_file = client.move_file id: file_info[:id], workspace_id: 1, destination_folder_id: folder[:id]
```
