# IFClient::SnapshotApi

All URIs are relative to *https://intelliflash/zebi/api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clone_project_snapshot_post**](SnapshotApi.md#clone_project_snapshot_post) | **POST** /cloneProjectSnapshot | Clones the specified project-level snapshot. This creates new datasets at the share and volume levels for all shares and volumes that have a snapshot with the specified name.
[**clone_share_snapshot_post**](SnapshotApi.md#clone_share_snapshot_post) | **POST** /cloneShareSnapshot | Clones the specified share-level snapshot.
[**clone_volume_snapshot_post**](SnapshotApi.md#clone_volume_snapshot_post) | **POST** /cloneVolumeSnapshot | Clones the specified snapshot of a volume.
[**create_project_snapshot_post**](SnapshotApi.md#create_project_snapshot_post) | **POST** /createProjectSnapshot | Recursively creates snapshots of the specified project and the datasets within the project. The string \&quot;Manual-P-\&quot; is prefixed to the names of the snapshots created.
[**create_share_snapshot_post**](SnapshotApi.md#create_share_snapshot_post) | **POST** /createShareSnapshot | Recursively creates snapshot of the specified share. The string \&quot;Manual-S-\&quot; is prefixed to names of the snapshots created.
[**create_snapshot_schedule_post**](SnapshotApi.md#create_snapshot_schedule_post) | **POST** /createSnapshotSchedule | Create snapshot schedule for a project, exclude pre-defined snapshot schedules
[**create_volume_snapshot_post**](SnapshotApi.md#create_volume_snapshot_post) | **POST** /createVolumeSnapshot | Recursively creates snapshot of the specified volume. The string \&quot;Manual-V-\&quot; is prefixed to the names of the snapshots created.
[**delete_project_snapshot_post**](SnapshotApi.md#delete_project_snapshot_post) | **POST** /deleteProjectSnapshot | Deletes the specified project snapshot.
[**delete_share_snapshot_post**](SnapshotApi.md#delete_share_snapshot_post) | **POST** /deleteShareSnapshot | Deletes the specified share snapshot.
[**delete_snapshot_schedule_post**](SnapshotApi.md#delete_snapshot_schedule_post) | **POST** /deleteSnapshotSchedule | Delete the snapshot schedule on that path with snapshotSuffix.
[**delete_snapshot_schedules_post**](SnapshotApi.md#delete_snapshot_schedules_post) | **POST** /deleteSnapshotSchedules | Delete all snapshot schedules for the specified dataset
[**delete_volume_snapshot_post**](SnapshotApi.md#delete_volume_snapshot_post) | **POST** /deleteVolumeSnapshot | Deletes the specified volume snapshot.
[**get_project_clone_status_post**](SnapshotApi.md#get_project_clone_status_post) | **POST** /getProjectCloneStatus | Gets the status of a clone request on the specified project snapshot.
[**get_project_snapshot_creation_status_post**](SnapshotApi.md#get_project_snapshot_creation_status_post) | **POST** /getProjectSnapshotCreationStatus | Gets the status of a project snapshot creation request.
[**get_share_snapshot_creation_status_post**](SnapshotApi.md#get_share_snapshot_creation_status_post) | **POST** /getShareSnapshotCreationStatus | Gets the status of a share snapshot creation request.
[**get_snapshot_schedule_post**](SnapshotApi.md#get_snapshot_schedule_post) | **POST** /getSnapshotSchedule | Get list of snapshot schedules for a dataset
[**get_volume_snapshot_creation_status_post**](SnapshotApi.md#get_volume_snapshot_creation_status_post) | **POST** /getVolumeSnapshotCreationStatus | Gets the status of a volume snapshot creation request.
[**inherit_snapshot_settings_from_project_post**](SnapshotApi.md#inherit_snapshot_settings_from_project_post) | **POST** /inheritSnapshotSettingsFromProject | Inherit project snapshot settings for local dataset
[**is_snapshot_schedules_inherited_from_project_post**](SnapshotApi.md#is_snapshot_schedules_inherited_from_project_post) | **POST** /isSnapshotSchedulesInheritedFromProject | Check if dataset is currently inheriting project snapshot settings
[**list_snapshots_post**](SnapshotApi.md#list_snapshots_post) | **POST** /listSnapshots | Lists names of snapshots (from the specified dataset) that match with the given regex pattern.
[**roll_back_to_project_snapshot_post**](SnapshotApi.md#roll_back_to_project_snapshot_post) | **POST** /rollBackToProjectSnapshot | Reverts the project state to the point-in-time state when the snapshot was taken.
[**roll_back_to_share_snapshot_post**](SnapshotApi.md#roll_back_to_share_snapshot_post) | **POST** /rollBackToShareSnapshot | Reverts the share state to the point-in-time state when the snapshot was taken.
[**roll_back_to_volume_snapshot_post**](SnapshotApi.md#roll_back_to_volume_snapshot_post) | **POST** /rollBackToVolumeSnapshot | Reverts the volume state to the point-in-time state when the snapshot was taken.


# **clone_project_snapshot_post**
> clone_project_snapshot_post(clone_project_snapshot_param)

Clones the specified project-level snapshot. This creates new datasets at the share and volume levels for all shares and volumes that have a snapshot with the specified name.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

clone_project_snapshot_param = IFClient::CloneProjectSnapshotParam.new # CloneProjectSnapshotParam | 


begin
  #Clones the specified project-level snapshot. This creates new datasets at the share and volume levels for all shares and volumes that have a snapshot with the specified name.
  api_instance.clone_project_snapshot_post(clone_project_snapshot_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->clone_project_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clone_project_snapshot_param** | [**CloneProjectSnapshotParam**](CloneProjectSnapshotParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **clone_share_snapshot_post**
> clone_share_snapshot_post(clone_share_snapshot_param)

Clones the specified share-level snapshot.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

clone_share_snapshot_param = IFClient::CloneShareSnapshotParam.new # CloneShareSnapshotParam | 


begin
  #Clones the specified share-level snapshot.
  api_instance.clone_share_snapshot_post(clone_share_snapshot_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->clone_share_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clone_share_snapshot_param** | [**CloneShareSnapshotParam**](CloneShareSnapshotParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **clone_volume_snapshot_post**
> clone_volume_snapshot_post(clone_volume_snapshot_param)

Clones the specified snapshot of a volume.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

clone_volume_snapshot_param = IFClient::CloneVolumeSnapshotParam.new # CloneVolumeSnapshotParam | 


begin
  #Clones the specified snapshot of a volume.
  api_instance.clone_volume_snapshot_post(clone_volume_snapshot_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->clone_volume_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clone_volume_snapshot_param** | [**CloneVolumeSnapshotParam**](CloneVolumeSnapshotParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_project_snapshot_post**
> create_project_snapshot_post(create_project_snapshot_param)

Recursively creates snapshots of the specified project and the datasets within the project. The string \"Manual-P-\" is prefixed to the names of the snapshots created.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

create_project_snapshot_param = IFClient::CreateProjectSnapshotParam.new # CreateProjectSnapshotParam | 


begin
  #Recursively creates snapshots of the specified project and the datasets within the project. The string \"Manual-P-\" is prefixed to the names of the snapshots created.
  api_instance.create_project_snapshot_post(create_project_snapshot_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->create_project_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_project_snapshot_param** | [**CreateProjectSnapshotParam**](CreateProjectSnapshotParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_share_snapshot_post**
> create_share_snapshot_post(create_share_snapshot_param)

Recursively creates snapshot of the specified share. The string \"Manual-S-\" is prefixed to names of the snapshots created.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

create_share_snapshot_param = IFClient::CreateShareSnapshotParam.new # CreateShareSnapshotParam | 


begin
  #Recursively creates snapshot of the specified share. The string \"Manual-S-\" is prefixed to names of the snapshots created.
  api_instance.create_share_snapshot_post(create_share_snapshot_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->create_share_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_share_snapshot_param** | [**CreateShareSnapshotParam**](CreateShareSnapshotParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_snapshot_schedule_post**
> create_snapshot_schedule_post(create_snapshot_schedule_param)

Create snapshot schedule for a project, exclude pre-defined snapshot schedules

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

create_snapshot_schedule_param = IFClient::CreateSnapshotScheduleParam.new # CreateSnapshotScheduleParam | 


begin
  #Create snapshot schedule for a project, exclude pre-defined snapshot schedules
  api_instance.create_snapshot_schedule_post(create_snapshot_schedule_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->create_snapshot_schedule_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_snapshot_schedule_param** | [**CreateSnapshotScheduleParam**](CreateSnapshotScheduleParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_volume_snapshot_post**
> create_volume_snapshot_post(create_volume_snapshot_param)

Recursively creates snapshot of the specified volume. The string \"Manual-V-\" is prefixed to the names of the snapshots created.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

create_volume_snapshot_param = IFClient::CreateVolumeSnapshotParam.new # CreateVolumeSnapshotParam | 


begin
  #Recursively creates snapshot of the specified volume. The string \"Manual-V-\" is prefixed to the names of the snapshots created.
  api_instance.create_volume_snapshot_post(create_volume_snapshot_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->create_volume_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_volume_snapshot_param** | [**CreateVolumeSnapshotParam**](CreateVolumeSnapshotParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_project_snapshot_post**
> SnapShotDeletionStatus delete_project_snapshot_post(delete_project_snapshot_param)

Deletes the specified project snapshot.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

delete_project_snapshot_param = IFClient::DeleteProjectSnapshotParam.new # DeleteProjectSnapshotParam | 


begin
  #Deletes the specified project snapshot.
  result = api_instance.delete_project_snapshot_post(delete_project_snapshot_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->delete_project_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_project_snapshot_param** | [**DeleteProjectSnapshotParam**](DeleteProjectSnapshotParam.md)|  | 

### Return type

[**SnapShotDeletionStatus**](SnapShotDeletionStatus.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_share_snapshot_post**
> SnapShotDeletionStatus delete_share_snapshot_post(delete_share_snapshot_param)

Deletes the specified share snapshot.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

delete_share_snapshot_param = IFClient::DeleteShareSnapshotParam.new # DeleteShareSnapshotParam | 


begin
  #Deletes the specified share snapshot.
  result = api_instance.delete_share_snapshot_post(delete_share_snapshot_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->delete_share_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_share_snapshot_param** | [**DeleteShareSnapshotParam**](DeleteShareSnapshotParam.md)|  | 

### Return type

[**SnapShotDeletionStatus**](SnapShotDeletionStatus.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_snapshot_schedule_post**
> COMMAND_STATUS delete_snapshot_schedule_post(delete_snapshot_schedule_param)

Delete the snapshot schedule on that path with snapshotSuffix.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

delete_snapshot_schedule_param = IFClient::DeleteSnapshotScheduleParam.new # DeleteSnapshotScheduleParam | 


begin
  #Delete the snapshot schedule on that path with snapshotSuffix.
  result = api_instance.delete_snapshot_schedule_post(delete_snapshot_schedule_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->delete_snapshot_schedule_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_snapshot_schedule_param** | [**DeleteSnapshotScheduleParam**](DeleteSnapshotScheduleParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_snapshot_schedules_post**
> COMMAND_STATUS delete_snapshot_schedules_post(delete_snapshot_schedules_param)

Delete all snapshot schedules for the specified dataset

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

delete_snapshot_schedules_param = IFClient::DeleteSnapshotSchedulesParam.new # DeleteSnapshotSchedulesParam | 


begin
  #Delete all snapshot schedules for the specified dataset
  result = api_instance.delete_snapshot_schedules_post(delete_snapshot_schedules_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->delete_snapshot_schedules_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_snapshot_schedules_param** | [**DeleteSnapshotSchedulesParam**](DeleteSnapshotSchedulesParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_volume_snapshot_post**
> SnapShotDeletionStatus delete_volume_snapshot_post(delete_volume_snapshot_param)

Deletes the specified volume snapshot.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

delete_volume_snapshot_param = IFClient::DeleteVolumeSnapshotParam.new # DeleteVolumeSnapshotParam | 


begin
  #Deletes the specified volume snapshot.
  result = api_instance.delete_volume_snapshot_post(delete_volume_snapshot_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->delete_volume_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_volume_snapshot_param** | [**DeleteVolumeSnapshotParam**](DeleteVolumeSnapshotParam.md)|  | 

### Return type

[**SnapShotDeletionStatus**](SnapShotDeletionStatus.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_project_clone_status_post**
> ProjectCloneProgressStatus_v1_2 get_project_clone_status_post(param)

Gets the status of a clone request on the specified project snapshot.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

param = IFClient::Param_1.new # Param_1 | 


begin
  #Gets the status of a clone request on the specified project snapshot.
  result = api_instance.get_project_clone_status_post(param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->get_project_clone_status_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **param** | [**Param_1**](Param_1.md)|  | 

### Return type

[**ProjectCloneProgressStatus_v1_2**](ProjectCloneProgressStatus_v1_2.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_project_snapshot_creation_status_post**
> SnapshotProgressStatus get_project_snapshot_creation_status_post(get_project_snapshot_creation_status_param)

Gets the status of a project snapshot creation request.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

get_project_snapshot_creation_status_param = IFClient::GetProjectSnapshotCreationStatusParam.new # GetProjectSnapshotCreationStatusParam | 


begin
  #Gets the status of a project snapshot creation request.
  result = api_instance.get_project_snapshot_creation_status_post(get_project_snapshot_creation_status_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->get_project_snapshot_creation_status_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_project_snapshot_creation_status_param** | [**GetProjectSnapshotCreationStatusParam**](GetProjectSnapshotCreationStatusParam.md)|  | 

### Return type

[**SnapshotProgressStatus**](SnapshotProgressStatus.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_share_snapshot_creation_status_post**
> SnapshotProgressStatus get_share_snapshot_creation_status_post(get_share_snapshot_creation_status_param)

Gets the status of a share snapshot creation request.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

get_share_snapshot_creation_status_param = IFClient::GetShareSnapshotCreationStatusParam.new # GetShareSnapshotCreationStatusParam | 


begin
  #Gets the status of a share snapshot creation request.
  result = api_instance.get_share_snapshot_creation_status_post(get_share_snapshot_creation_status_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->get_share_snapshot_creation_status_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_share_snapshot_creation_status_param** | [**GetShareSnapshotCreationStatusParam**](GetShareSnapshotCreationStatusParam.md)|  | 

### Return type

[**SnapshotProgressStatus**](SnapshotProgressStatus.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_snapshot_schedule_post**
> Array&lt;SnapshotSchedule_V2_1&gt; get_snapshot_schedule_post(get_snapshot_schedule_param)

Get list of snapshot schedules for a dataset

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

get_snapshot_schedule_param = IFClient::GetSnapshotScheduleParam.new # GetSnapshotScheduleParam | 


begin
  #Get list of snapshot schedules for a dataset
  result = api_instance.get_snapshot_schedule_post(get_snapshot_schedule_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->get_snapshot_schedule_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_snapshot_schedule_param** | [**GetSnapshotScheduleParam**](GetSnapshotScheduleParam.md)|  | 

### Return type

[**Array&lt;SnapshotSchedule_V2_1&gt;**](SnapshotSchedule_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_volume_snapshot_creation_status_post**
> SnapshotProgressStatus get_volume_snapshot_creation_status_post(get_volume_snapshot_creation_status_param)

Gets the status of a volume snapshot creation request.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

get_volume_snapshot_creation_status_param = IFClient::GetVolumeSnapshotCreationStatusParam.new # GetVolumeSnapshotCreationStatusParam | 


begin
  #Gets the status of a volume snapshot creation request.
  result = api_instance.get_volume_snapshot_creation_status_post(get_volume_snapshot_creation_status_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->get_volume_snapshot_creation_status_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_volume_snapshot_creation_status_param** | [**GetVolumeSnapshotCreationStatusParam**](GetVolumeSnapshotCreationStatusParam.md)|  | 

### Return type

[**SnapshotProgressStatus**](SnapshotProgressStatus.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **inherit_snapshot_settings_from_project_post**
> COMMAND_STATUS inherit_snapshot_settings_from_project_post(inherit_snapshot_settings_from_project_param)

Inherit project snapshot settings for local dataset

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

inherit_snapshot_settings_from_project_param = IFClient::InheritSnapshotSettingsFromProjectParam.new # InheritSnapshotSettingsFromProjectParam | 


begin
  #Inherit project snapshot settings for local dataset
  result = api_instance.inherit_snapshot_settings_from_project_post(inherit_snapshot_settings_from_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->inherit_snapshot_settings_from_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inherit_snapshot_settings_from_project_param** | [**InheritSnapshotSettingsFromProjectParam**](InheritSnapshotSettingsFromProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **is_snapshot_schedules_inherited_from_project_post**
> is_snapshot_schedules_inherited_from_project_post(is_snapshot_schedules_inherited_from_project_param)

Check if dataset is currently inheriting project snapshot settings

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

is_snapshot_schedules_inherited_from_project_param = IFClient::IsSnapshotSchedulesInheritedFromProjectParam.new # IsSnapshotSchedulesInheritedFromProjectParam | 


begin
  #Check if dataset is currently inheriting project snapshot settings
  api_instance.is_snapshot_schedules_inherited_from_project_post(is_snapshot_schedules_inherited_from_project_param)
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->is_snapshot_schedules_inherited_from_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **is_snapshot_schedules_inherited_from_project_param** | [**IsSnapshotSchedulesInheritedFromProjectParam**](IsSnapshotSchedulesInheritedFromProjectParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_snapshots_post**
> Array&lt;String&gt; list_snapshots_post(list_snapshots_param)

Lists names of snapshots (from the specified dataset) that match with the given regex pattern.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

list_snapshots_param = IFClient::ListSnapshotsParam.new # ListSnapshotsParam | 


begin
  #Lists names of snapshots (from the specified dataset) that match with the given regex pattern.
  result = api_instance.list_snapshots_post(list_snapshots_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->list_snapshots_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_snapshots_param** | [**ListSnapshotsParam**](ListSnapshotsParam.md)|  | 

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **roll_back_to_project_snapshot_post**
> COMMAND_STATUS roll_back_to_project_snapshot_post(roll_back_to_project_snapshot_param)

Reverts the project state to the point-in-time state when the snapshot was taken.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

roll_back_to_project_snapshot_param = IFClient::RollBackToProjectSnapshotParam.new # RollBackToProjectSnapshotParam | 


begin
  #Reverts the project state to the point-in-time state when the snapshot was taken.
  result = api_instance.roll_back_to_project_snapshot_post(roll_back_to_project_snapshot_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->roll_back_to_project_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roll_back_to_project_snapshot_param** | [**RollBackToProjectSnapshotParam**](RollBackToProjectSnapshotParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **roll_back_to_share_snapshot_post**
> COMMAND_STATUS roll_back_to_share_snapshot_post(param)

Reverts the share state to the point-in-time state when the snapshot was taken.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

param = IFClient::Param_2.new # Param_2 | 


begin
  #Reverts the share state to the point-in-time state when the snapshot was taken.
  result = api_instance.roll_back_to_share_snapshot_post(param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->roll_back_to_share_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **param** | [**Param_2**](Param_2.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **roll_back_to_volume_snapshot_post**
> COMMAND_STATUS roll_back_to_volume_snapshot_post(roll_back_to_volume_snapshot_param)

Reverts the volume state to the point-in-time state when the snapshot was taken.

### Example
```ruby
# load the gem
require 'tegile-api'
# setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = IFClient::SnapshotApi.new

roll_back_to_volume_snapshot_param = IFClient::RollBackToVolumeSnapshotParam.new # RollBackToVolumeSnapshotParam | 


begin
  #Reverts the volume state to the point-in-time state when the snapshot was taken.
  result = api_instance.roll_back_to_volume_snapshot_post(roll_back_to_volume_snapshot_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SnapshotApi->roll_back_to_volume_snapshot_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roll_back_to_volume_snapshot_param** | [**RollBackToVolumeSnapshotParam**](RollBackToVolumeSnapshotParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



