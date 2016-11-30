# caplinked-api-ruby

Ruby SDK for Caplinked's API


## Quick start guide:

Add Rubygem to Bundle:

```
gem 'caplinked-api-ruby'
```
## Activities:

Get Workspace Activities:

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'
get_workspace_activities = client.client.get_workspace_activities workspace_id: 1, user_id: 1
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
