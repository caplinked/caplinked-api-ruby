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

## Folders:

Create a folder

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
create_a_new_folder = client.create_a_new_folder workspace_id: 1, parent_id: folder[:id], name: 'name'
```

Delete folder

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
delete_folder = client.delete_folder workspace_id: 1, id: folder[:id]
```

Get folder info

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
get_folder_info = client.get_folder_info workspace_id: 1, id: folder[:id]
```

Update folder info

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
update_folder_info = client.update_folder_info id: folder[:id], workspace_id: 1, folder: { name: 'name', index: folder[:index]}
```

Copy folder

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
copy_folder = client.copy_folder id: folder[:id], workspace_id: 1, destination_folder_id: folder[:id]
```

Move folder

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
move_folder = client.move_folder id: folder[:id], workspace_id: 1, destination_folder_id: folder[:id]
```

##Groups:
List all groups in workspace

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
list_all_groups_in_workspace = client.list_all_groups_in_workspace workspace_id: 1
```

Create group

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
create_group = client.create_group group: {name: 'name', workspace_id: 1, file_managing_abilities: false}
```
Update group

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
update_group = client.update_group id: group[:id], workspace_id: 1, group: {name: 'name', file_managing_abilities: true}
```
Get group info

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
get_group_info = client.get_group_info id: group[:id], workspace_id: 1
```
Delete group

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
get_group_info = client.get_group_info id: group[:id], workspace_id: 1
```
Update group drm

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
update_group_drm = client.update_group_drm id: group[:id], workspace_id: 1, group: {drm_enabled: true, drm_expires_after: 'YYYY-MM-DD'}
```
Disable drm expiration

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
disable_drm_expiration = client.disable_drm_expiration id: group[:id], workspace_id: 1
```
Watermarking for group

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
watermarking_for_group = client.watermarking_for_group id: group[:id], workspace_id: 1, group: {watermarking: true}
```
Enable access expiration

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
enable_access_expiration = client.enable_access_expiration id: group[:id], workspace_id: 1, group: {expire_workspace_access_at: "YYYY-MM-DD"}
```
Disable access expiration

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
disable_access_expiration = client.disable_access_expiration id: group[:id], workspace_id: 1
```
Add group member

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
add_group_member = client.add_group_member id: group[:id], user_id: user[:id], workspace_id: 1, send_email: false
```
Remove group member

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
remove_group_member = client.remove_group_member id: group[:id], user_id: user[:id], workspace_id: 1
```

List all group members

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'  
list_all_group_members = client.list_all_group_members id: group[:id], workspace_id: 1
```