# IFClient::DataApi

All URIs are relative to *https://intelliflash/zebi/api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_project_post**](DataApi.md#create_project_post) | **POST** /createProject | Creates a project
[**create_share_post**](DataApi.md#create_share_post) | **POST** /createShare | Creates a share with the specified share options and share permissions.
[**create_volume_post**](DataApi.md#create_volume_post) | **POST** /createVolume | Creates a volume with the specified settings.
[**delete_dataset_post**](DataApi.md#delete_dataset_post) | **POST** /deleteDataset | Deletes the specified dataset.
[**delete_project_post**](DataApi.md#delete_project_post) | **POST** /deleteProject | Deletes the specified project.
[**delete_share_post**](DataApi.md#delete_share_post) | **POST** /deleteShare | Deletes the specified share, and optionally, any dependents of the share.
[**delete_volume_post**](DataApi.md#delete_volume_post) | **POST** /deleteVolume | Deletes the specified volume, and optionally, any dependents of the volume.
[**get_project_post**](DataApi.md#get_project_post) | **POST** /getProject | Get the Project details.
[**get_share_post**](DataApi.md#get_share_post) | **POST** /getShare | Get the Share details.
[**get_volume_post**](DataApi.md#get_volume_post) | **POST** /getVolume | Get the Volume details.
[**inherit_property_from_project_post**](DataApi.md#inherit_property_from_project_post) | **POST** /inheritPropertyFromProject | Inherit properties from parent project settings (revert/rollback to parent setting)
[**list_luns_by_id_post**](DataApi.md#list_luns_by_id_post) | **POST** /listLunsById | Lists LUN details for the specified LUN IDs.
[**list_pools_get**](DataApi.md#list_pools_get) | **GET** /listPools | Lists all the pools on the Tegile array
[**list_projects_post**](DataApi.md#list_projects_post) | **POST** /listProjects | Lists all the local or replicated projects in a pool.
[**list_shares_post**](DataApi.md#list_shares_post) | **POST** /listShares | Lists all the local and replicated shares in a project.
[**list_volumes_post**](DataApi.md#list_volumes_post) | **POST** /listVolumes | Lists all the local or replicated volumes within a Project.
[**modify_project_properties_post**](DataApi.md#modify_project_properties_post) | **POST** /modifyProjectProperties | Modify value of a subset of Project properties
[**modify_share_properties_post**](DataApi.md#modify_share_properties_post) | **POST** /modifyShareProperties | Modify value of a subset of project properties
[**modify_volume_properties_post**](DataApi.md#modify_volume_properties_post) | **POST** /modifyVolumeProperties | Modify value of a subset of Volume properties


# **create_project_post**
> COMMAND_STATUS create_project_post(create_project_param)

Creates a project

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

api_instance = IFClient::DataApi.new

create_project_param = IFClient::CreateProjectParam.new # CreateProjectParam | 


begin
  #Creates a project
  result = api_instance.create_project_post(create_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->create_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_project_param** | [**CreateProjectParam**](CreateProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_share_post**
> COMMAND_STATUS create_share_post(create_share_param)

Creates a share with the specified share options and share permissions.

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

api_instance = IFClient::DataApi.new

create_share_param = IFClient::CreateShareParam.new # CreateShareParam | 


begin
  #Creates a share with the specified share options and share permissions.
  result = api_instance.create_share_post(create_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->create_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_share_param** | [**CreateShareParam**](CreateShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_volume_post**
> COMMAND_STATUS create_volume_post(create_volume_param)

Creates a volume with the specified settings.

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

api_instance = IFClient::DataApi.new

create_volume_param = IFClient::CreateVolumeParam.new # CreateVolumeParam | 


begin
  #Creates a volume with the specified settings.
  result = api_instance.create_volume_post(create_volume_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->create_volume_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_volume_param** | [**CreateVolumeParam**](CreateVolumeParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_dataset_post**
> delete_dataset_post(delete_dataset_param)

Deletes the specified dataset.

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

api_instance = IFClient::DataApi.new

delete_dataset_param = IFClient::DeleteDatasetParam.new # DeleteDatasetParam | 


begin
  #Deletes the specified dataset.
  api_instance.delete_dataset_post(delete_dataset_param)
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->delete_dataset_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_dataset_param** | [**DeleteDatasetParam**](DeleteDatasetParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_project_post**
> COMMAND_STATUS delete_project_post(delete_project_param)

Deletes the specified project.

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

api_instance = IFClient::DataApi.new

delete_project_param = IFClient::DeleteProjectParam.new # DeleteProjectParam | 


begin
  #Deletes the specified project.
  result = api_instance.delete_project_post(delete_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->delete_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_project_param** | [**DeleteProjectParam**](DeleteProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_share_post**
> delete_share_post(delete_share_param)

Deletes the specified share, and optionally, any dependents of the share.

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

api_instance = IFClient::DataApi.new

delete_share_param = IFClient::DeleteShareParam.new # DeleteShareParam | 


begin
  #Deletes the specified share, and optionally, any dependents of the share.
  api_instance.delete_share_post(delete_share_param)
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->delete_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_share_param** | [**DeleteShareParam**](DeleteShareParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_volume_post**
> delete_volume_post(delete_volume_param)

Deletes the specified volume, and optionally, any dependents of the volume.

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

api_instance = IFClient::DataApi.new

delete_volume_param = IFClient::DeleteVolumeParam.new # DeleteVolumeParam | 


begin
  #Deletes the specified volume, and optionally, any dependents of the volume.
  api_instance.delete_volume_post(delete_volume_param)
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->delete_volume_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_volume_param** | [**DeleteVolumeParam**](DeleteVolumeParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_project_post**
> Project_V2_1 get_project_post(get_project_param)

Get the Project details.

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

api_instance = IFClient::DataApi.new

get_project_param = IFClient::GetProjectParam.new # GetProjectParam | 


begin
  #Get the Project details.
  result = api_instance.get_project_post(get_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->get_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_project_param** | [**GetProjectParam**](GetProjectParam.md)|  | 

### Return type

[**Project_V2_1**](Project_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_share_post**
> Share_V2_1 get_share_post(get_share_param)

Get the Share details.

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

api_instance = IFClient::DataApi.new

get_share_param = IFClient::GetShareParam.new # GetShareParam | 


begin
  #Get the Share details.
  result = api_instance.get_share_post(get_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->get_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_share_param** | [**GetShareParam**](GetShareParam.md)|  | 

### Return type

[**Share_V2_1**](Share_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_volume_post**
> Volume_V2_1 get_volume_post(get_volume_param)

Get the Volume details.

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

api_instance = IFClient::DataApi.new

get_volume_param = IFClient::GetVolumeParam.new # GetVolumeParam | 


begin
  #Get the Volume details.
  result = api_instance.get_volume_post(get_volume_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->get_volume_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_volume_param** | [**GetVolumeParam**](GetVolumeParam.md)|  | 

### Return type

[**Volume_V2_1**](Volume_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **inherit_property_from_project_post**
> COMMAND_STATUS inherit_property_from_project_post(inherit_property_from_project_param)

Inherit properties from parent project settings (revert/rollback to parent setting)

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

api_instance = IFClient::DataApi.new

inherit_property_from_project_param = IFClient::InheritPropertyFromProjectParam.new # InheritPropertyFromProjectParam | 


begin
  #Inherit properties from parent project settings (revert/rollback to parent setting)
  result = api_instance.inherit_property_from_project_post(inherit_property_from_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->inherit_property_from_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inherit_property_from_project_param** | [**InheritPropertyFromProjectParam**](InheritPropertyFromProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_luns_by_id_post**
> Array&lt;LunStatus&gt; list_luns_by_id_post(list_luns_by_id_param)

Lists LUN details for the specified LUN IDs.

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

api_instance = IFClient::DataApi.new

list_luns_by_id_param = IFClient::ListLunsByIdParam.new # ListLunsByIdParam | 


begin
  #Lists LUN details for the specified LUN IDs.
  result = api_instance.list_luns_by_id_post(list_luns_by_id_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->list_luns_by_id_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_luns_by_id_param** | [**ListLunsByIdParam**](ListLunsByIdParam.md)|  | 

### Return type

[**Array&lt;LunStatus&gt;**](LunStatus.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_pools_get**
> Array&lt;Pool_V1_0&gt; list_pools_get

Lists all the pools on the Tegile array

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

api_instance = IFClient::DataApi.new

begin
  #Lists all the pools on the Tegile array
  result = api_instance.list_pools_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->list_pools_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Array&lt;Pool_V1_0&gt;**](Pool_V1_0.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_projects_post**
> Array&lt;Project_V1_0&gt; list_projects_post(list_projects_param)

Lists all the local or replicated projects in a pool.

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

api_instance = IFClient::DataApi.new

list_projects_param = IFClient::ListProjectsParam.new # ListProjectsParam | 


begin
  #Lists all the local or replicated projects in a pool.
  result = api_instance.list_projects_post(list_projects_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->list_projects_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_projects_param** | [**ListProjectsParam**](ListProjectsParam.md)|  | 

### Return type

[**Array&lt;Project_V1_0&gt;**](Project_V1_0.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_shares_post**
> Array&lt;Share_V1_0&gt; list_shares_post(list_shares_param)

Lists all the local and replicated shares in a project.

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

api_instance = IFClient::DataApi.new

list_shares_param = IFClient::ListSharesParam.new # ListSharesParam | 


begin
  #Lists all the local and replicated shares in a project.
  result = api_instance.list_shares_post(list_shares_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->list_shares_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_shares_param** | [**ListSharesParam**](ListSharesParam.md)|  | 

### Return type

[**Array&lt;Share_V1_0&gt;**](Share_V1_0.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_volumes_post**
> Array&lt;Volume_V1_0&gt; list_volumes_post(list_volumes_param)

Lists all the local or replicated volumes within a Project.

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

api_instance = IFClient::DataApi.new

list_volumes_param = IFClient::ListVolumesParam.new # ListVolumesParam | 


begin
  #Lists all the local or replicated volumes within a Project.
  result = api_instance.list_volumes_post(list_volumes_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->list_volumes_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_volumes_param** | [**ListVolumesParam**](ListVolumesParam.md)|  | 

### Return type

[**Array&lt;Volume_V1_0&gt;**](Volume_V1_0.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **modify_project_properties_post**
> COMMAND_STATUS modify_project_properties_post(modify_project_properties_param)

Modify value of a subset of Project properties

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

api_instance = IFClient::DataApi.new

modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new # ModifyProjectPropertiesParam | 


begin
  #Modify value of a subset of Project properties
  result = api_instance.modify_project_properties_post(modify_project_properties_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->modify_project_properties_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **modify_project_properties_param** | [**ModifyProjectPropertiesParam**](ModifyProjectPropertiesParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **modify_share_properties_post**
> COMMAND_STATUS modify_share_properties_post(modify_share_properties_param)

Modify value of a subset of project properties

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

api_instance = IFClient::DataApi.new

modify_share_properties_param = IFClient::ModifySharePropertiesParam.new # ModifySharePropertiesParam | 


begin
  #Modify value of a subset of project properties
  result = api_instance.modify_share_properties_post(modify_share_properties_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->modify_share_properties_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **modify_share_properties_param** | [**ModifySharePropertiesParam**](ModifySharePropertiesParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **modify_volume_properties_post**
> COMMAND_STATUS modify_volume_properties_post(modify_volume_properties_param)

Modify value of a subset of Volume properties

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

api_instance = IFClient::DataApi.new

modify_volume_properties_param = IFClient::ModifyVolumePropertiesParam.new # ModifyVolumePropertiesParam | 


begin
  #Modify value of a subset of Volume properties
  result = api_instance.modify_volume_properties_post(modify_volume_properties_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->modify_volume_properties_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **modify_volume_properties_param** | [**ModifyVolumePropertiesParam**](ModifyVolumePropertiesParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



