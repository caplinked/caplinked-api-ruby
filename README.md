# caplinked-api

Ruby SDK for Caplinked's API
Documentation at https://developer.caplinked.com/docs

## Quick start guide:

Add Rubygem to Bundle:

```
gem 'caplinked-api'
```

Assign Client

```
client = Caplinked::Client.new api_key: 'YOUR_KEY_HERE', api_host: 'sandbox.caplinked.com', api_scheme: 'https'
```
## Activities:

Get Workspace Activities:

```
get_workspace_activities = client.client.get_workspace_activities workspace_id: 1, user_id: user[:id]
```

## Downloads:

Create a zip file

```
create_zip_file = client.create_zip_file workspace_id: 1, download: { folder_ids: [folder[:id], folder[:id]] }
```

Download a single file

```
single_file_download = client.single_file_download file_id: file_info[:id], workspace_id: 1
```

Download status

```
download_status = client.download_status workspace_id: 1
```

Delete download

```
delete_download = client.delete_download id: download[:id], workspace_id: 1
```

Get zip

```
get_zip = client.get_zip id: download[:id], workspace_id: 1
```

## Files:

Upload a File:

```
new_file = client.upload_file workspace_id: 1, folder_id: 1, file_name: 'test_photo.jpg', file: File.read('/your/local/test_photo.jpg')
```

Get File info:

```
file_info = client.get_file_info id: new_file[:id], workspace_id: 1
```

Delete File:

```
delete_file = client.delete_file workspace_id: 1, id: file_info[:id]
```

Update File info:

```
update_file = client.update_file_info workspace_id: 1, id: file_info[:id], 'file[title]': 'name', 'file[index]': file[:index]
```

Copy File:

```
copy_file = client.copy_file id: file_info[:id], workspace_id: 1, destination_folder_id: folder[:id]
```

Move File:

```
move_file = client.move_file id: file_info[:id], workspace_id: 1, destination_folder_id: folder[:id]
```

## Folders:

Create a folder

```
create_a_new_folder = client.create_a_new_folder workspace_id: 1, parent_id: folder[:id], name: 'name'
```

Delete folder

```
delete_folder = client.delete_folder workspace_id: 1, id: folder[:id]
```

Get folder info

```
get_folder_info = client.get_folder_info workspace_id: 1, id: folder[:id]
```

Update folder info

```
update_folder_info = client.update_folder_info id: folder[:id], workspace_id: 1, folder: { name: 'name', index: folder[:index]}
```

Copy folder

```
copy_folder = client.copy_folder id: folder[:id], workspace_id: 1, destination_folder_id: folder[:id]
```

Move folder

```
move_folder = client.move_folder id: folder[:id], workspace_id: 1, destination_folder_id: folder[:id]
```

##Groups:
List all groups in workspace

```
list_all_groups_in_workspace = client.list_all_groups_in_workspace workspace_id: 1
```

Create group

```
create_group = client.create_group group: {name: 'name', workspace_id: 1, file_managing_abilities: false}
```
Update group

```
update_group = client.update_group id: group[:id], workspace_id: 1, group: {name: 'name', file_managing_abilities: true}
```
Get group info

```
get_group_info = client.get_group_info id: group[:id], workspace_id: 1
```
Delete group

```
get_group_info = client.get_group_info id: group[:id], workspace_id: 1
```
Update group drm

```
update_group_drm = client.update_group_drm id: group[:id], workspace_id: 1, group: {drm_enabled: true, drm_expires_after: 'YYYY-MM-DD'}
```
Disable drm expiration

```
disable_drm_expiration = client.disable_drm_expiration id: group[:id], workspace_id: 1
```
Watermarking for group

```
watermarking_for_group = client.watermarking_for_group id: group[:id], workspace_id: 1, group: {watermarking: true}
```
Enable access expiration

```
enable_access_expiration = client.enable_access_expiration id: group[:id], workspace_id: 1, group: {expire_workspace_access_at: "YYYY-MM-DD"}
```
Disable access expiration

```
disable_access_expiration = client.disable_access_expiration id: group[:id], workspace_id: 1
```
Add group member

```
add_group_member = client.add_group_member id: group[:id], user_id: user[:id], workspace_id: 1, send_email: false
```
Remove group member

```
remove_group_member = client.remove_group_member id: group[:id], user_id: user[:id], workspace_id: 1
```

List all group members

```
list_all_group_members = client.list_all_group_members id: group[:id], workspace_id: 1
```

##Organizations

Get organization info

```
get_organization_info = client.get_organization_info
```
Update organization info

```
update_organization_info = client.update_organization_info name: 'name', description: 'description', location: 'location', billing_email: 'billing email address', url: 'url'
```

Update organization support info

```
update_organization_support_info = client.update_organization_support_info email: 'support email', phone_number: 'support phone number', website: 'support website'
```
Add organization member

```
add_organization_member = client.add_organization_member user_id: user[:id]
```
remove organization member

```
remove_organization_member = client.remove_organization_member user_id: 101
```
show organization members

```
show_organization_members = client.show_organization_members
```

##Permissions

Get folder permissions

```
get_folder_permissions = client.get_folder_permissions id: folder[:id], workspace_id: 1, group_id: group[:id]
```
Update folder permissions

```
update_folder_permissions = client.update_folder_permissions id: folder[:id], workspace_id: 1, group_id: group[:id], verb: 'grant', folder_action: 'download'
```

##Teams

Create team

```
create_team = client.create_team team: { name: 'name', allowed_workspaces: 5, allowed_admins: 5, drm_enabled: false, watermarking: false, suppress_emails: false }
```
Get list of teams within the organization

```
get_team_list = client.get_list_of_teams
```

Get team info

```
get_team_info = client.get_team_info id: team[:id]
```

Update team info

```
update_team = client.update_team_info id: 183, team: { name: 'name', allowed_workspaces: 10, allowed_admins: 10, drm_enabled: true, watermarking: true, suppress_emails: true }
```
Add team member

```
add_team_member = client.add_team_member id: team[:id], user_id: user[:id]
```
Remove team member

```
remove_team_member = client.remove_team_member id: team[:id], user_id: user[:id]
```

Get list of team members

```
get_list_of_team_members = client.get_list_of_team_members id: team[:id]
```

##Users

Create user

```
create_user = client.create_user user: { email: 'email address', first_name: 'first name', last_name: 'last name', time_zone: "Pacific Time (US & Canada)" }
```

Get user info

```
get_user_info = client.get_user_info
```
Update user

```
update_user = client.update_user user: { email: 'new email address'}
```

##Workspace
List all workspaces for a team

```
list_all_workspaces_for_a_team = client.list_all_workspaces_for_a_team team_id: team[:id]
```
Create Workspace

```
create_workspace = client.create_workspace team_id: team[:id], workspace: { name: 'name'}
```

Get Workspace info

```
get_workspace_info = client.get_workspace_info id: workspace[:id]
```
Update workspace info

```
update_workspace_info = client.update_workspace_info id: workspace[:id], workspace: {name: "name name"}
```
