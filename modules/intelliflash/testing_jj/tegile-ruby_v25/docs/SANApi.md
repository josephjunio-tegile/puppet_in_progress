# IFClient::SANApi

All URIs are relative to *https://intelliflash/zebi/api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_initiator_to_initiator_group_post**](SANApi.md#add_initiator_to_initiator_group_post) | **POST** /addInitiatorToInitiatorGroup | Associates an initiator with an initiator group.
[**create_fc_initiator_post**](SANApi.md#create_fc_initiator_post) | **POST** /createFCInitiator | Create an FC Initiator
[**create_initiator_group_post**](SANApi.md#create_initiator_group_post) | **POST** /createInitiatorGroup | Creates an initiator group on a Tegile array.
[**create_iscsi_initiator_post**](SANApi.md#create_iscsi_initiator_post) | **POST** /createIscsiInitiator | Creates an iSCSI initiator object on the Tegile array. If the initiator name already exists, then the method fails.
[**create_iscsi_target_for_group_post**](SANApi.md#create_iscsi_target_for_group_post) | **POST** /createISCSITargetForGroup | Create an iSCSI Target and add into specified Target Group
[**create_iscsi_target_post**](SANApi.md#create_iscsi_target_post) | **POST** /createISCSITarget | Create an iSCSI Target
[**create_mapping_for_project_post**](SANApi.md#create_mapping_for_project_post) | **POST** /createMappingForProject | Create a project level default mapping
[**create_mapping_for_volume_post**](SANApi.md#create_mapping_for_volume_post) | **POST** /createMappingForVolume | Maps a volume to an initiator group and a target group.
[**create_target_group_post**](SANApi.md#create_target_group_post) | **POST** /createTargetGroup | Create a target group with the specified target group name in the resource group containing the named pool with the intended protocol  
[**delete_initiator_group_post**](SANApi.md#delete_initiator_group_post) | **POST** /deleteInitiatorGroup | Delete an Initiator Group
[**delete_iscsi_initiator_post**](SANApi.md#delete_iscsi_initiator_post) | **POST** /deleteISCSIInitiator | Delete an iSCSI Initiator
[**delete_iscsi_target_post**](SANApi.md#delete_iscsi_target_post) | **POST** /deleteISCSITarget | Delete an iSCSI Target
[**delete_mapping_from_project_post**](SANApi.md#delete_mapping_from_project_post) | **POST** /deleteMappingFromProject | Deletes the view (mapping) between the given project, initiator group, and target group.
[**delete_mapping_from_volume_post**](SANApi.md#delete_mapping_from_volume_post) | **POST** /deleteMappingFromVolume | Deletes the view (mapping) between the given volume, initiator group, and target group.
[**delete_target_group_post**](SANApi.md#delete_target_group_post) | **POST** /deleteTargetGroup | Delete a Target Group
[**get_initiator_group_post**](SANApi.md#get_initiator_group_post) | **POST** /getInitiatorGroup | Gets the name of the initiator group to which the initiator belongs.
[**get_project_default_fc_it_view_post**](SANApi.md#get_project_default_fc_it_view_post) | **POST** /getProjectDefaultFcITView | List all of the default FC views of the project
[**get_project_default_iscsi_it_view_post**](SANApi.md#get_project_default_iscsi_it_view_post) | **POST** /getProjectDefaultIscsiITView | List all of the default iSCSI views of the project
[**get_volume_it_view_post**](SANApi.md#get_volume_it_view_post) | **POST** /getVolumeITView | List all of the existing views of the volume
[**initiator_group_exists_post**](SANApi.md#initiator_group_exists_post) | **POST** /initiatorGroupExists | Checks if an initiator group exists on the Tegile array.
[**list_fc_initiator_groups_get**](SANApi.md#list_fc_initiator_groups_get) | **GET** /listFCInitiatorGroups | Lists the names of all Fibre Channel initiator groups created on a Tegile array.
[**list_fc_initiators_post**](SANApi.md#list_fc_initiators_post) | **POST** /listFCInitiators | List Fibre Channel Initiators with name matching specified pattern
[**list_fc_target_groups_get**](SANApi.md#list_fc_target_groups_get) | **GET** /listFCTargetGroups | Lists all Fibre Channel Target groups available on a Tegile array.
[**list_fc_targets_post**](SANApi.md#list_fc_targets_post) | **POST** /listFCTargets | List Fibre Channel Targets with name matching specified pattern
[**list_initiator_groups_get**](SANApi.md#list_initiator_groups_get) | **GET** /listInitiatorGroups | List all initiator groups available on IntelliFlash Array
[**list_initiators_in_initiator_group_post**](SANApi.md#list_initiators_in_initiator_group_post) | **POST** /listInitiatorsInInitiatorGroup | Lists all initiators belonging to the specified initiator group.
[**list_iscsi_initiator_groups_get**](SANApi.md#list_iscsi_initiator_groups_get) | **GET** /listISCSIInitiatorGroups | Lists all the iSCSI initiator groups available on a Tegile array.
[**list_iscsi_initiators_post**](SANApi.md#list_iscsi_initiators_post) | **POST** /listISCSIInitiators | List iSCSI Initiators with name matching specified pattern
[**list_iscsi_target_groups_get**](SANApi.md#list_iscsi_target_groups_get) | **GET** /listISCSITargetGroups | Lists all the iSCSI target groups available on a Tegile array.
[**list_iscsi_targets_post**](SANApi.md#list_iscsi_targets_post) | **POST** /listISCSITargets | List iSCSI Targets with name matching specified pattern
[**list_target_groups_get**](SANApi.md#list_target_groups_get) | **GET** /listTargetGroups | List all target groups available on IntelliFlash Array
[**list_targets_in_target_group_post**](SANApi.md#list_targets_in_target_group_post) | **POST** /listTargetsInTargetGroup | Lists all targets associated with the target group.
[**modify_iscsi_target_alias_post**](SANApi.md#modify_iscsi_target_alias_post) | **POST** /modifyISCSITargetAlias | Modify Alias of an iSCSI Target
[**move_initiator_to_initiator_group_post**](SANApi.md#move_initiator_to_initiator_group_post) | **POST** /moveInitiatorToInitiatorGroup | Move an iSCSI or Fibre Channel Initiator to an existing Initiator Group.
[**move_target_to_target_group_post**](SANApi.md#move_target_to_target_group_post) | **POST** /moveTargetToTargetGroup | Move a Target to an existing Target Group.


# **add_initiator_to_initiator_group_post**
> COMMAND_STATUS add_initiator_to_initiator_group_post(add_initiator_to_initiator_group_param)

Associates an initiator with an initiator group.

Associates an initiator with an initiator group. If the initiator group is not present then this method attempts to create it.  If the initiator does not exist, then the method fails. 

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

api_instance = IFClient::SANApi.new

add_initiator_to_initiator_group_param = IFClient::AddInitiatorToInitiatorGroupParam.new # AddInitiatorToInitiatorGroupParam | 


begin
  #Associates an initiator with an initiator group.
  result = api_instance.add_initiator_to_initiator_group_post(add_initiator_to_initiator_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->add_initiator_to_initiator_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **add_initiator_to_initiator_group_param** | [**AddInitiatorToInitiatorGroupParam**](AddInitiatorToInitiatorGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_fc_initiator_post**
> COMMAND_STATUS create_fc_initiator_post(create_fc_initiator_param)

Create an FC Initiator

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

api_instance = IFClient::SANApi.new

create_fc_initiator_param = IFClient::CreateFCInitiatorParam.new # CreateFCInitiatorParam | 


begin
  #Create an FC Initiator
  result = api_instance.create_fc_initiator_post(create_fc_initiator_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_fc_initiator_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_fc_initiator_param** | [**CreateFCInitiatorParam**](CreateFCInitiatorParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_initiator_group_post**
> COMMAND_STATUS create_initiator_group_post(create_initiator_group_param)

Creates an initiator group on a Tegile array.

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

api_instance = IFClient::SANApi.new

create_initiator_group_param = IFClient::CreateInitiatorGroupParam.new # CreateInitiatorGroupParam | 


begin
  #Creates an initiator group on a Tegile array.
  result = api_instance.create_initiator_group_post(create_initiator_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_initiator_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_initiator_group_param** | [**CreateInitiatorGroupParam**](CreateInitiatorGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_iscsi_initiator_post**
> COMMAND_STATUS create_iscsi_initiator_post(create_iscsi_initiator_param)

Creates an iSCSI initiator object on the Tegile array. If the initiator name already exists, then the method fails.

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

api_instance = IFClient::SANApi.new

create_iscsi_initiator_param = IFClient::CreateIscsiInitiatorParam.new # CreateIscsiInitiatorParam | IscsiInitiator_V1_0 that contains the name of the initiator and optional CHAP information


begin
  #Creates an iSCSI initiator object on the Tegile array. If the initiator name already exists, then the method fails.
  result = api_instance.create_iscsi_initiator_post(create_iscsi_initiator_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_iscsi_initiator_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_iscsi_initiator_param** | [**CreateIscsiInitiatorParam**](CreateIscsiInitiatorParam.md)| IscsiInitiator_V1_0 that contains the name of the initiator and optional CHAP information | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_iscsi_target_for_group_post**
> COMMAND_STATUS create_iscsi_target_for_group_post(create_iscsi_target_for_group_param)

Create an iSCSI Target and add into specified Target Group

This is a simpler version of createIscsiTarget() api that has all the parameters for target creation. This api will default to the iSCSI network bindings associated with a target group. It will default to none (or no) chap authentication. It will allow the user to create a new iSCSI target with the user specified target suffix, alias and group name. 

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

api_instance = IFClient::SANApi.new

create_iscsi_target_for_group_param = IFClient::CreateISCSITargetForGroupParam.new # CreateISCSITargetForGroupParam | 


begin
  #Create an iSCSI Target and add into specified Target Group
  result = api_instance.create_iscsi_target_for_group_post(create_iscsi_target_for_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_iscsi_target_for_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_iscsi_target_for_group_param** | [**CreateISCSITargetForGroupParam**](CreateISCSITargetForGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_iscsi_target_post**
> COMMAND_STATUS create_iscsi_target_post(create_iscsi_target_param)

Create an iSCSI Target

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

api_instance = IFClient::SANApi.new

create_iscsi_target_param = IFClient::CreateISCSITargetParam.new # CreateISCSITargetParam | 


begin
  #Create an iSCSI Target
  result = api_instance.create_iscsi_target_post(create_iscsi_target_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_iscsi_target_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_iscsi_target_param** | [**CreateISCSITargetParam**](CreateISCSITargetParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_mapping_for_project_post**
> COMMAND_STATUS create_mapping_for_project_post(create_mapping_for_project_param)

Create a project level default mapping

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

api_instance = IFClient::SANApi.new

create_mapping_for_project_param = IFClient::CreateMappingForProjectParam.new # CreateMappingForProjectParam | 


begin
  #Create a project level default mapping
  result = api_instance.create_mapping_for_project_post(create_mapping_for_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_mapping_for_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_mapping_for_project_param** | [**CreateMappingForProjectParam**](CreateMappingForProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_mapping_for_volume_post**
> COMMAND_STATUS create_mapping_for_volume_post(create_mapping_for_volume_param)

Maps a volume to an initiator group and a target group.

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

api_instance = IFClient::SANApi.new

create_mapping_for_volume_param = IFClient::CreateMappingForVolumeParam.new # CreateMappingForVolumeParam | 


begin
  #Maps a volume to an initiator group and a target group.
  result = api_instance.create_mapping_for_volume_post(create_mapping_for_volume_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_mapping_for_volume_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_mapping_for_volume_param** | [**CreateMappingForVolumeParam**](CreateMappingForVolumeParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_target_group_post**
> COMMAND_STATUS create_target_group_post(create_target_group_param)

Create a target group with the specified target group name in the resource group containing the named pool with the intended protocol  

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

api_instance = IFClient::SANApi.new

create_target_group_param = IFClient::CreateTargetGroupParam.new # CreateTargetGroupParam | 


begin
  #Create a target group with the specified target group name in the resource group containing the named pool with the intended protocol  
  result = api_instance.create_target_group_post(create_target_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->create_target_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_target_group_param** | [**CreateTargetGroupParam**](CreateTargetGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_initiator_group_post**
> COMMAND_STATUS delete_initiator_group_post(delete_initiator_group_param)

Delete an Initiator Group

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

api_instance = IFClient::SANApi.new

delete_initiator_group_param = IFClient::DeleteInitiatorGroupParam.new # DeleteInitiatorGroupParam | 


begin
  #Delete an Initiator Group
  result = api_instance.delete_initiator_group_post(delete_initiator_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->delete_initiator_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_initiator_group_param** | [**DeleteInitiatorGroupParam**](DeleteInitiatorGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_iscsi_initiator_post**
> COMMAND_STATUS delete_iscsi_initiator_post(delete_iscsi_initiator_param)

Delete an iSCSI Initiator

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

api_instance = IFClient::SANApi.new

delete_iscsi_initiator_param = IFClient::DeleteISCSIInitiatorParam.new # DeleteISCSIInitiatorParam | 


begin
  #Delete an iSCSI Initiator
  result = api_instance.delete_iscsi_initiator_post(delete_iscsi_initiator_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->delete_iscsi_initiator_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_iscsi_initiator_param** | [**DeleteISCSIInitiatorParam**](DeleteISCSIInitiatorParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_iscsi_target_post**
> COMMAND_STATUS delete_iscsi_target_post(delete_iscsi_target_param)

Delete an iSCSI Target

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

api_instance = IFClient::SANApi.new

delete_iscsi_target_param = IFClient::DeleteISCSITargetParam.new # DeleteISCSITargetParam | 


begin
  #Delete an iSCSI Target
  result = api_instance.delete_iscsi_target_post(delete_iscsi_target_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->delete_iscsi_target_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_iscsi_target_param** | [**DeleteISCSITargetParam**](DeleteISCSITargetParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_mapping_from_project_post**
> COMMAND_STATUS delete_mapping_from_project_post(delete_mapping_from_project_param)

Deletes the view (mapping) between the given project, initiator group, and target group.

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

api_instance = IFClient::SANApi.new

delete_mapping_from_project_param = IFClient::DeleteMappingFromProjectParam.new # DeleteMappingFromProjectParam | 


begin
  #Deletes the view (mapping) between the given project, initiator group, and target group.
  result = api_instance.delete_mapping_from_project_post(delete_mapping_from_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->delete_mapping_from_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_mapping_from_project_param** | [**DeleteMappingFromProjectParam**](DeleteMappingFromProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_mapping_from_volume_post**
> COMMAND_STATUS delete_mapping_from_volume_post(delete_mapping_from_volume_param)

Deletes the view (mapping) between the given volume, initiator group, and target group.

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

api_instance = IFClient::SANApi.new

delete_mapping_from_volume_param = IFClient::DeleteMappingFromVolumeParam.new # DeleteMappingFromVolumeParam | 


begin
  #Deletes the view (mapping) between the given volume, initiator group, and target group.
  result = api_instance.delete_mapping_from_volume_post(delete_mapping_from_volume_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->delete_mapping_from_volume_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_mapping_from_volume_param** | [**DeleteMappingFromVolumeParam**](DeleteMappingFromVolumeParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_target_group_post**
> COMMAND_STATUS delete_target_group_post(delete_target_group_param)

Delete a Target Group

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

api_instance = IFClient::SANApi.new

delete_target_group_param = IFClient::DeleteTargetGroupParam.new # DeleteTargetGroupParam | 


begin
  #Delete a Target Group
  result = api_instance.delete_target_group_post(delete_target_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->delete_target_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_target_group_param** | [**DeleteTargetGroupParam**](DeleteTargetGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_initiator_group_post**
> String get_initiator_group_post(get_initiator_group_param)

Gets the name of the initiator group to which the initiator belongs.

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

api_instance = IFClient::SANApi.new

get_initiator_group_param = IFClient::GetInitiatorGroupParam.new # GetInitiatorGroupParam | 


begin
  #Gets the name of the initiator group to which the initiator belongs.
  result = api_instance.get_initiator_group_post(get_initiator_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->get_initiator_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_initiator_group_param** | [**GetInitiatorGroupParam**](GetInitiatorGroupParam.md)|  | 

### Return type

**String**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_project_default_fc_it_view_post**
> Array&lt;ITView_V2_1&gt; get_project_default_fc_it_view_post(get_project_default_fc_it_view_param)

List all of the default FC views of the project

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

api_instance = IFClient::SANApi.new

get_project_default_fc_it_view_param = IFClient::GetProjectDefaultFcITViewParam.new # GetProjectDefaultFcITViewParam | 


begin
  #List all of the default FC views of the project
  result = api_instance.get_project_default_fc_it_view_post(get_project_default_fc_it_view_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->get_project_default_fc_it_view_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_project_default_fc_it_view_param** | [**GetProjectDefaultFcITViewParam**](GetProjectDefaultFcITViewParam.md)|  | 

### Return type

[**Array&lt;ITView_V2_1&gt;**](ITView_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_project_default_iscsi_it_view_post**
> Array&lt;ITView_V2_1&gt; get_project_default_iscsi_it_view_post(get_project_default_iscsi_it_view_param)

List all of the default iSCSI views of the project

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

api_instance = IFClient::SANApi.new

get_project_default_iscsi_it_view_param = IFClient::GetProjectDefaultIscsiITViewParam.new # GetProjectDefaultIscsiITViewParam | 


begin
  #List all of the default iSCSI views of the project
  result = api_instance.get_project_default_iscsi_it_view_post(get_project_default_iscsi_it_view_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->get_project_default_iscsi_it_view_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_project_default_iscsi_it_view_param** | [**GetProjectDefaultIscsiITViewParam**](GetProjectDefaultIscsiITViewParam.md)|  | 

### Return type

[**Array&lt;ITView_V2_1&gt;**](ITView_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_volume_it_view_post**
> Array&lt;ITView_V2_1&gt; get_volume_it_view_post(get_volume_it_view_param)

List all of the existing views of the volume

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

api_instance = IFClient::SANApi.new

get_volume_it_view_param = IFClient::GetVolumeITViewParam.new # GetVolumeITViewParam | 


begin
  #List all of the existing views of the volume
  result = api_instance.get_volume_it_view_post(get_volume_it_view_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->get_volume_it_view_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_volume_it_view_param** | [**GetVolumeITViewParam**](GetVolumeITViewParam.md)|  | 

### Return type

[**Array&lt;ITView_V2_1&gt;**](ITView_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **initiator_group_exists_post**
> BOOLEAN initiator_group_exists_post(initiator_group_exists_param)

Checks if an initiator group exists on the Tegile array.

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

api_instance = IFClient::SANApi.new

initiator_group_exists_param = IFClient::InitiatorGroupExistsParam.new # InitiatorGroupExistsParam | 


begin
  #Checks if an initiator group exists on the Tegile array.
  result = api_instance.initiator_group_exists_post(initiator_group_exists_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->initiator_group_exists_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **initiator_group_exists_param** | [**InitiatorGroupExistsParam**](InitiatorGroupExistsParam.md)|  | 

### Return type

**BOOLEAN**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_fc_initiator_groups_get**
> Array&lt;String&gt; list_fc_initiator_groups_get

Lists the names of all Fibre Channel initiator groups created on a Tegile array.

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

api_instance = IFClient::SANApi.new

begin
  #Lists the names of all Fibre Channel initiator groups created on a Tegile array.
  result = api_instance.list_fc_initiator_groups_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_fc_initiator_groups_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_fc_initiators_post**
> Array&lt;FCInitiator_V2_1&gt; list_fc_initiators_post(list_fc_initiators_param)

List Fibre Channel Initiators with name matching specified pattern

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

api_instance = IFClient::SANApi.new

list_fc_initiators_param = IFClient::ListFCInitiatorsParam.new # ListFCInitiatorsParam | 


begin
  #List Fibre Channel Initiators with name matching specified pattern
  result = api_instance.list_fc_initiators_post(list_fc_initiators_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_fc_initiators_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_fc_initiators_param** | [**ListFCInitiatorsParam**](ListFCInitiatorsParam.md)|  | 

### Return type

[**Array&lt;FCInitiator_V2_1&gt;**](FCInitiator_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_fc_target_groups_get**
> Array&lt;String&gt; list_fc_target_groups_get

Lists all Fibre Channel Target groups available on a Tegile array.

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

api_instance = IFClient::SANApi.new

begin
  #Lists all Fibre Channel Target groups available on a Tegile array.
  result = api_instance.list_fc_target_groups_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_fc_target_groups_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_fc_targets_post**
> Array&lt;FCTarget_V2_1&gt; list_fc_targets_post(list_fc_targets_param)

List Fibre Channel Targets with name matching specified pattern

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

api_instance = IFClient::SANApi.new

list_fc_targets_param = IFClient::ListFCTargetsParam.new # ListFCTargetsParam | 


begin
  #List Fibre Channel Targets with name matching specified pattern
  result = api_instance.list_fc_targets_post(list_fc_targets_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_fc_targets_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_fc_targets_param** | [**ListFCTargetsParam**](ListFCTargetsParam.md)|  | 

### Return type

[**Array&lt;FCTarget_V2_1&gt;**](FCTarget_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_initiator_groups_get**
> Array&lt;InitiatorGroup_V2_1&gt; list_initiator_groups_get

List all initiator groups available on IntelliFlash Array

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

api_instance = IFClient::SANApi.new

begin
  #List all initiator groups available on IntelliFlash Array
  result = api_instance.list_initiator_groups_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_initiator_groups_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Array&lt;InitiatorGroup_V2_1&gt;**](InitiatorGroup_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_initiators_in_initiator_group_post**
> Array&lt;String&gt; list_initiators_in_initiator_group_post(list_initiators_in_initiator_group_param)

Lists all initiators belonging to the specified initiator group.

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

api_instance = IFClient::SANApi.new

list_initiators_in_initiator_group_param = IFClient::ListInitiatorsInInitiatorGroupParam.new # ListInitiatorsInInitiatorGroupParam | 


begin
  #Lists all initiators belonging to the specified initiator group.
  result = api_instance.list_initiators_in_initiator_group_post(list_initiators_in_initiator_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_initiators_in_initiator_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_initiators_in_initiator_group_param** | [**ListInitiatorsInInitiatorGroupParam**](ListInitiatorsInInitiatorGroupParam.md)|  | 

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_iscsi_initiator_groups_get**
> Array&lt;String&gt; list_iscsi_initiator_groups_get

Lists all the iSCSI initiator groups available on a Tegile array.

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

api_instance = IFClient::SANApi.new

begin
  #Lists all the iSCSI initiator groups available on a Tegile array.
  result = api_instance.list_iscsi_initiator_groups_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_iscsi_initiator_groups_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_iscsi_initiators_post**
> Array&lt;ISCSIInitiator_V2_1&gt; list_iscsi_initiators_post(list_iscsi_initiators_param)

List iSCSI Initiators with name matching specified pattern

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

api_instance = IFClient::SANApi.new

list_iscsi_initiators_param = IFClient::ListISCSIInitiatorsParam.new # ListISCSIInitiatorsParam | 


begin
  #List iSCSI Initiators with name matching specified pattern
  result = api_instance.list_iscsi_initiators_post(list_iscsi_initiators_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_iscsi_initiators_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_iscsi_initiators_param** | [**ListISCSIInitiatorsParam**](ListISCSIInitiatorsParam.md)|  | 

### Return type

[**Array&lt;ISCSIInitiator_V2_1&gt;**](ISCSIInitiator_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_iscsi_target_groups_get**
> Array&lt;String&gt; list_iscsi_target_groups_get

Lists all the iSCSI target groups available on a Tegile array.

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

api_instance = IFClient::SANApi.new

begin
  #Lists all the iSCSI target groups available on a Tegile array.
  result = api_instance.list_iscsi_target_groups_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_iscsi_target_groups_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_iscsi_targets_post**
> Array&lt;ISCSITarget_V2_1&gt; list_iscsi_targets_post(list_iscsi_targets_param)

List iSCSI Targets with name matching specified pattern

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

api_instance = IFClient::SANApi.new

list_iscsi_targets_param = IFClient::ListISCSITargetsParam.new # ListISCSITargetsParam | 


begin
  #List iSCSI Targets with name matching specified pattern
  result = api_instance.list_iscsi_targets_post(list_iscsi_targets_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_iscsi_targets_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_iscsi_targets_param** | [**ListISCSITargetsParam**](ListISCSITargetsParam.md)|  | 

### Return type

[**Array&lt;ISCSITarget_V2_1&gt;**](ISCSITarget_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_target_groups_get**
> Array&lt;TargetGroup_V2_2&gt; list_target_groups_get

List all target groups available on IntelliFlash Array

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

api_instance = IFClient::SANApi.new

begin
  #List all target groups available on IntelliFlash Array
  result = api_instance.list_target_groups_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_target_groups_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Array&lt;TargetGroup_V2_2&gt;**](TargetGroup_V2_2.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **list_targets_in_target_group_post**
> Array&lt;String&gt; list_targets_in_target_group_post(list_targets_in_target_group_param)

Lists all targets associated with the target group.

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

api_instance = IFClient::SANApi.new

list_targets_in_target_group_param = IFClient::ListTargetsInTargetGroupParam.new # ListTargetsInTargetGroupParam | 


begin
  #Lists all targets associated with the target group.
  result = api_instance.list_targets_in_target_group_post(list_targets_in_target_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->list_targets_in_target_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_targets_in_target_group_param** | [**ListTargetsInTargetGroupParam**](ListTargetsInTargetGroupParam.md)|  | 

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **modify_iscsi_target_alias_post**
> COMMAND_STATUS modify_iscsi_target_alias_post(param)

Modify Alias of an iSCSI Target

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

api_instance = IFClient::SANApi.new

param = IFClient::Param.new # Param | 


begin
  #Modify Alias of an iSCSI Target
  result = api_instance.modify_iscsi_target_alias_post(param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->modify_iscsi_target_alias_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **param** | [**Param**](Param.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **move_initiator_to_initiator_group_post**
> COMMAND_STATUS move_initiator_to_initiator_group_post(move_initiator_to_initiator_group_param)

Move an iSCSI or Fibre Channel Initiator to an existing Initiator Group.

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

api_instance = IFClient::SANApi.new

move_initiator_to_initiator_group_param = IFClient::MoveInitiatorToInitiatorGroupParam.new # MoveInitiatorToInitiatorGroupParam | 


begin
  #Move an iSCSI or Fibre Channel Initiator to an existing Initiator Group.
  result = api_instance.move_initiator_to_initiator_group_post(move_initiator_to_initiator_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->move_initiator_to_initiator_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **move_initiator_to_initiator_group_param** | [**MoveInitiatorToInitiatorGroupParam**](MoveInitiatorToInitiatorGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **move_target_to_target_group_post**
> COMMAND_STATUS move_target_to_target_group_post(move_target_to_target_group_param)

Move a Target to an existing Target Group.

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

api_instance = IFClient::SANApi.new

move_target_to_target_group_param = IFClient::MoveTargetToTargetGroupParam.new # MoveTargetToTargetGroupParam | 


begin
  #Move a Target to an existing Target Group.
  result = api_instance.move_target_to_target_group_post(move_target_to_target_group_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->move_target_to_target_group_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **move_target_to_target_group_param** | [**MoveTargetToTargetGroupParam**](MoveTargetToTargetGroupParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



