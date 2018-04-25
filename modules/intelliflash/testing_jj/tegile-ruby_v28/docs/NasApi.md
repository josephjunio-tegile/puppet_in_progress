# IFClient::NasApi

All URIs are relative to *https://intelliflash/zebi/api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_nfs_network_acl_on_project_post**](NasApi.md#add_nfs_network_acl_on_project_post) | **POST** /addNFSNetworkACLOnProject | Add network ACL to NFS Project
[**add_nfs_network_acl_on_share_post**](NasApi.md#add_nfs_network_acl_on_share_post) | **POST** /addNFSNetworkACLOnShare | Add network ACL to NFS share
[**add_smb_network_acl_on_project_post**](NasApi.md#add_smb_network_acl_on_project_post) | **POST** /addSMBNetworkACLOnProject | Add network ACL to SMB Project
[**add_smb_network_acl_on_share_post**](NasApi.md#add_smb_network_acl_on_share_post) | **POST** /addSMBNetworkACLOnShare | Add network ACL to SMB share
[**get_nfs_network_ac_ls_on_project_post**](NasApi.md#get_nfs_network_ac_ls_on_project_post) | **POST** /getNFSNetworkACLsOnProject | Returns all the Network ACLs for the NFS Project
[**get_nfs_network_ac_ls_on_share_post**](NasApi.md#get_nfs_network_ac_ls_on_share_post) | **POST** /getNFSNetworkACLsOnShare | Returns all the Network ACLs for the NFS share
[**get_smb_config_get**](NasApi.md#get_smb_config_get) | **GET** /getSMBConfig | Get SMB configuration
[**get_smb_network_ac_ls_on_project_post**](NasApi.md#get_smb_network_ac_ls_on_project_post) | **POST** /getSMBNetworkACLsOnProject | Returns all the Network ACLs for the SMB Project
[**get_smb_network_ac_ls_on_share_post**](NasApi.md#get_smb_network_ac_ls_on_share_post) | **POST** /getSMBNetworkACLsOnShare | Returns all the Network ACLs for the SMB share
[**inherit_network_ac_lsettings_from_project_post**](NasApi.md#inherit_network_ac_lsettings_from_project_post) | **POST** /inheritNetworkACLsettingsFromProject | Set the share property to inherit NFS or SMB ACL settings from project.
[**is_project_exposed_over_nfs_post**](NasApi.md#is_project_exposed_over_nfs_post) | **POST** /isProjectExposedOverNFS | Returns whether the NFS protocol is enabled for the Project
[**is_project_exposed_over_smb_post**](NasApi.md#is_project_exposed_over_smb_post) | **POST** /isProjectExposedOverSMB | Returns whether the SMB protocol is enabled for the Project
[**is_share_exposed_over_nfs_post**](NasApi.md#is_share_exposed_over_nfs_post) | **POST** /isShareExposedOverNFS | Returns whether the NFS protocol is enabled for the share
[**is_share_exposed_over_smb_post**](NasApi.md#is_share_exposed_over_smb_post) | **POST** /isShareExposedOverSMB | Returns whether the SMB protocol is enabled for the share
[**remove_all_nfs_network_ac_ls_on_project_post**](NasApi.md#remove_all_nfs_network_ac_ls_on_project_post) | **POST** /removeAllNFSNetworkACLsOnProject | Remove All network ACLs from NFS Project
[**remove_all_nfs_network_ac_ls_on_share_post**](NasApi.md#remove_all_nfs_network_ac_ls_on_share_post) | **POST** /removeAllNFSNetworkACLsOnShare | Remove All network ACLs from NFS share
[**remove_all_smb_network_ac_ls_on_project_post**](NasApi.md#remove_all_smb_network_ac_ls_on_project_post) | **POST** /removeAllSMBNetworkACLsOnProject | Remove All network ACLs from SMB Project
[**remove_all_smb_network_ac_ls_on_share_post**](NasApi.md#remove_all_smb_network_ac_ls_on_share_post) | **POST** /removeAllSMBNetworkACLsOnShare | Remove All network ACLs from SMB share
[**remove_nfs_network_acl_on_project_post**](NasApi.md#remove_nfs_network_acl_on_project_post) | **POST** /removeNFSNetworkACLOnProject | Remove network ACL from NFS Project
[**remove_nfs_network_acl_on_share_post**](NasApi.md#remove_nfs_network_acl_on_share_post) | **POST** /removeNFSNetworkACLOnShare | Remove network ACL from NFS share
[**remove_smb_network_acl_on_project_post**](NasApi.md#remove_smb_network_acl_on_project_post) | **POST** /removeSMBNetworkACLOnProject | Remove network ACL from SMB Project
[**remove_smb_network_acl_on_share_post**](NasApi.md#remove_smb_network_acl_on_share_post) | **POST** /removeSMBNetworkACLOnShare | Remove network ACL from SMB share
[**set_nfs_network_ac_ls_on_project_post**](NasApi.md#set_nfs_network_ac_ls_on_project_post) | **POST** /setNFSNetworkACLsOnProject | Set the network ACLS on the NFS Project If the dataset contains any network ACLs, they will be removed as well.
[**set_nfs_network_ac_ls_on_share_post**](NasApi.md#set_nfs_network_ac_ls_on_share_post) | **POST** /setNFSNetworkACLsOnShare | Set the network ACLS on the NFS share. If the dataset contains any network ACLs, they will be removed as well.
[**set_nfs_sharing_on_project_post**](NasApi.md#set_nfs_sharing_on_project_post) | **POST** /setNFSSharingOnProject | Enable/Disable NFS protocol for a Project
[**set_nfs_sharing_on_share_post**](NasApi.md#set_nfs_sharing_on_share_post) | **POST** /setNFSSharingOnShare | Enable/Disable NFS protocol for a share. If the dataset contains any network ACLs, they will be removed as well.
[**set_smb_config_post**](NasApi.md#set_smb_config_post) | **POST** /setSMBConfig | Set SMB configuration
[**set_smb_network_ac_ls_on_project_post**](NasApi.md#set_smb_network_ac_ls_on_project_post) | **POST** /setSMBNetworkACLsOnProject | Set the network ACLS on the SMB Project If the dataset contains any network ACLs, they will be removed as well.
[**set_smb_network_ac_ls_on_share_post**](NasApi.md#set_smb_network_ac_ls_on_share_post) | **POST** /setSMBNetworkACLsOnShare | Set the network ACLS on the SMB share. If the dataset contains any network ACLs, they will be removed as well.
[**set_smb_sharing_on_project_post**](NasApi.md#set_smb_sharing_on_project_post) | **POST** /setSMBSharingOnProject | Enable/Disable SMB protocol for a Project, If the dataset contains any network ACLs, they are removed as well.
[**set_smb_sharing_on_share_post**](NasApi.md#set_smb_sharing_on_share_post) | **POST** /setSMBSharingOnShare | Enable/Disable SMB protocol for a share. If the dataset contains any network ACLs, they will be removed as well.


# **add_nfs_network_acl_on_project_post**
> COMMAND_STATUS add_nfs_network_acl_on_project_post(add_nfs_network_acl_on_project_param)

Add network ACL to NFS Project

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

api_instance = IFClient::NasApi.new

add_nfs_network_acl_on_project_param = IFClient::AddNFSNetworkACLOnProjectParam.new # AddNFSNetworkACLOnProjectParam | 


begin
  #Add network ACL to NFS Project
  result = api_instance.add_nfs_network_acl_on_project_post(add_nfs_network_acl_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->add_nfs_network_acl_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **add_nfs_network_acl_on_project_param** | [**AddNFSNetworkACLOnProjectParam**](AddNFSNetworkACLOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **add_nfs_network_acl_on_share_post**
> COMMAND_STATUS add_nfs_network_acl_on_share_post(add_nfs_network_acl_on_param)

Add network ACL to NFS share

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

api_instance = IFClient::NasApi.new

add_nfs_network_acl_on_param = IFClient::AddNFSNetworkACLOnParam.new # AddNFSNetworkACLOnParam | 


begin
  #Add network ACL to NFS share
  result = api_instance.add_nfs_network_acl_on_share_post(add_nfs_network_acl_on_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->add_nfs_network_acl_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **add_nfs_network_acl_on_param** | [**AddNFSNetworkACLOnParam**](AddNFSNetworkACLOnParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **add_smb_network_acl_on_project_post**
> COMMAND_STATUS add_smb_network_acl_on_project_post(add_smb_network_acl_on_project_param)

Add network ACL to SMB Project

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

api_instance = IFClient::NasApi.new

add_smb_network_acl_on_project_param = IFClient::AddSMBNetworkACLOnProjectParam.new # AddSMBNetworkACLOnProjectParam | 


begin
  #Add network ACL to SMB Project
  result = api_instance.add_smb_network_acl_on_project_post(add_smb_network_acl_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->add_smb_network_acl_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **add_smb_network_acl_on_project_param** | [**AddSMBNetworkACLOnProjectParam**](AddSMBNetworkACLOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **add_smb_network_acl_on_share_post**
> COMMAND_STATUS add_smb_network_acl_on_share_post(add_smb_network_acl_on_param)

Add network ACL to SMB share

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

api_instance = IFClient::NasApi.new

add_smb_network_acl_on_param = IFClient::AddSMBNetworkACLOnParam.new # AddSMBNetworkACLOnParam | 


begin
  #Add network ACL to SMB share
  result = api_instance.add_smb_network_acl_on_share_post(add_smb_network_acl_on_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->add_smb_network_acl_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **add_smb_network_acl_on_param** | [**AddSMBNetworkACLOnParam**](AddSMBNetworkACLOnParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_nfs_network_ac_ls_on_project_post**
> Array&lt;NetworkACL_V2_1&gt; get_nfs_network_ac_ls_on_project_post(get_nfs_network_ac_ls_on_project_param)

Returns all the Network ACLs for the NFS Project

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

api_instance = IFClient::NasApi.new

get_nfs_network_ac_ls_on_project_param = IFClient::GetNFSNetworkACLsOnProjectParam.new # GetNFSNetworkACLsOnProjectParam | 


begin
  #Returns all the Network ACLs for the NFS Project
  result = api_instance.get_nfs_network_ac_ls_on_project_post(get_nfs_network_ac_ls_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->get_nfs_network_ac_ls_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_nfs_network_ac_ls_on_project_param** | [**GetNFSNetworkACLsOnProjectParam**](GetNFSNetworkACLsOnProjectParam.md)|  | 

### Return type

[**Array&lt;NetworkACL_V2_1&gt;**](NetworkACL_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_nfs_network_ac_ls_on_share_post**
> Array&lt;NetworkACL_V2_1&gt; get_nfs_network_ac_ls_on_share_post(get_nfs_network_ac_ls_on_share_param)

Returns all the Network ACLs for the NFS share

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

api_instance = IFClient::NasApi.new

get_nfs_network_ac_ls_on_share_param = IFClient::GetNFSNetworkACLsOnShareParam.new # GetNFSNetworkACLsOnShareParam | 


begin
  #Returns all the Network ACLs for the NFS share
  result = api_instance.get_nfs_network_ac_ls_on_share_post(get_nfs_network_ac_ls_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->get_nfs_network_ac_ls_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_nfs_network_ac_ls_on_share_param** | [**GetNFSNetworkACLsOnShareParam**](GetNFSNetworkACLsOnShareParam.md)|  | 

### Return type

[**Array&lt;NetworkACL_V2_1&gt;**](NetworkACL_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_smb_config_get**
> SMBConfig_V2_2 get_smb_config_get

Get SMB configuration

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

api_instance = IFClient::NasApi.new

begin
  #Get SMB configuration
  result = api_instance.get_smb_config_get
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->get_smb_config_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SMBConfig_V2_2**](SMBConfig_V2_2.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_smb_network_ac_ls_on_project_post**
> Array&lt;NetworkACL_V2_1&gt; get_smb_network_ac_ls_on_project_post(get_smb_network_ac_ls_on_project_param)

Returns all the Network ACLs for the SMB Project

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

api_instance = IFClient::NasApi.new

get_smb_network_ac_ls_on_project_param = IFClient::GetSMBNetworkACLsOnProjectParam.new # GetSMBNetworkACLsOnProjectParam | 


begin
  #Returns all the Network ACLs for the SMB Project
  result = api_instance.get_smb_network_ac_ls_on_project_post(get_smb_network_ac_ls_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->get_smb_network_ac_ls_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_smb_network_ac_ls_on_project_param** | [**GetSMBNetworkACLsOnProjectParam**](GetSMBNetworkACLsOnProjectParam.md)|  | 

### Return type

[**Array&lt;NetworkACL_V2_1&gt;**](NetworkACL_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_smb_network_ac_ls_on_share_post**
> Array&lt;NetworkACL_V2_1&gt; get_smb_network_ac_ls_on_share_post(get_smb_network_ac_ls_on_share_param)

Returns all the Network ACLs for the SMB share

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

api_instance = IFClient::NasApi.new

get_smb_network_ac_ls_on_share_param = IFClient::GetSMBNetworkACLsOnShareParam.new # GetSMBNetworkACLsOnShareParam | 


begin
  #Returns all the Network ACLs for the SMB share
  result = api_instance.get_smb_network_ac_ls_on_share_post(get_smb_network_ac_ls_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->get_smb_network_ac_ls_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_smb_network_ac_ls_on_share_param** | [**GetSMBNetworkACLsOnShareParam**](GetSMBNetworkACLsOnShareParam.md)|  | 

### Return type

[**Array&lt;NetworkACL_V2_1&gt;**](NetworkACL_V2_1.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **inherit_network_ac_lsettings_from_project_post**
> COMMAND_STATUS inherit_network_ac_lsettings_from_project_post(inherit_network_ac_lsettings_from_project_param)

Set the share property to inherit NFS or SMB ACL settings from project.

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

api_instance = IFClient::NasApi.new

inherit_network_ac_lsettings_from_project_param = IFClient::InheritNetworkACLsettingsFromProjectParam.new # InheritNetworkACLsettingsFromProjectParam | 


begin
  #Set the share property to inherit NFS or SMB ACL settings from project.
  result = api_instance.inherit_network_ac_lsettings_from_project_post(inherit_network_ac_lsettings_from_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->inherit_network_ac_lsettings_from_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inherit_network_ac_lsettings_from_project_param** | [**InheritNetworkACLsettingsFromProjectParam**](InheritNetworkACLsettingsFromProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **is_project_exposed_over_nfs_post**
> BOOLEAN is_project_exposed_over_nfs_post(is_project_exposed_over_nfs_param)

Returns whether the NFS protocol is enabled for the Project

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

api_instance = IFClient::NasApi.new

is_project_exposed_over_nfs_param = IFClient::IsProjectExposedOverNFSParam.new # IsProjectExposedOverNFSParam | 


begin
  #Returns whether the NFS protocol is enabled for the Project
  result = api_instance.is_project_exposed_over_nfs_post(is_project_exposed_over_nfs_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->is_project_exposed_over_nfs_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **is_project_exposed_over_nfs_param** | [**IsProjectExposedOverNFSParam**](IsProjectExposedOverNFSParam.md)|  | 

### Return type

**BOOLEAN**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **is_project_exposed_over_smb_post**
> BOOLEAN is_project_exposed_over_smb_post(is_project_exposed_over_smb_param)

Returns whether the SMB protocol is enabled for the Project

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

api_instance = IFClient::NasApi.new

is_project_exposed_over_smb_param = IFClient::IsProjectExposedOverSMBParam.new # IsProjectExposedOverSMBParam | 


begin
  #Returns whether the SMB protocol is enabled for the Project
  result = api_instance.is_project_exposed_over_smb_post(is_project_exposed_over_smb_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->is_project_exposed_over_smb_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **is_project_exposed_over_smb_param** | [**IsProjectExposedOverSMBParam**](IsProjectExposedOverSMBParam.md)|  | 

### Return type

**BOOLEAN**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **is_share_exposed_over_nfs_post**
> BOOLEAN is_share_exposed_over_nfs_post(is_share_exposed_over_nfs_param)

Returns whether the NFS protocol is enabled for the share

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

api_instance = IFClient::NasApi.new

is_share_exposed_over_nfs_param = IFClient::IsShareExposedOverNFSParam.new # IsShareExposedOverNFSParam | 


begin
  #Returns whether the NFS protocol is enabled for the share
  result = api_instance.is_share_exposed_over_nfs_post(is_share_exposed_over_nfs_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->is_share_exposed_over_nfs_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **is_share_exposed_over_nfs_param** | [**IsShareExposedOverNFSParam**](IsShareExposedOverNFSParam.md)|  | 

### Return type

**BOOLEAN**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **is_share_exposed_over_smb_post**
> BOOLEAN is_share_exposed_over_smb_post(is_share_exposed_over_smb_param)

Returns whether the SMB protocol is enabled for the share

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

api_instance = IFClient::NasApi.new

is_share_exposed_over_smb_param = IFClient::IsShareExposedOverSMBParam.new # IsShareExposedOverSMBParam | 


begin
  #Returns whether the SMB protocol is enabled for the share
  result = api_instance.is_share_exposed_over_smb_post(is_share_exposed_over_smb_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->is_share_exposed_over_smb_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **is_share_exposed_over_smb_param** | [**IsShareExposedOverSMBParam**](IsShareExposedOverSMBParam.md)|  | 

### Return type

**BOOLEAN**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_all_nfs_network_ac_ls_on_project_post**
> COMMAND_STATUS remove_all_nfs_network_ac_ls_on_project_post(remove_all_nfs_network_ac_ls_on_project_param)

Remove All network ACLs from NFS Project

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

api_instance = IFClient::NasApi.new

remove_all_nfs_network_ac_ls_on_project_param = IFClient::RemoveAllNFSNetworkACLsOnProjectParam.new # RemoveAllNFSNetworkACLsOnProjectParam | 


begin
  #Remove All network ACLs from NFS Project
  result = api_instance.remove_all_nfs_network_ac_ls_on_project_post(remove_all_nfs_network_ac_ls_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_all_nfs_network_ac_ls_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_all_nfs_network_ac_ls_on_project_param** | [**RemoveAllNFSNetworkACLsOnProjectParam**](RemoveAllNFSNetworkACLsOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_all_nfs_network_ac_ls_on_share_post**
> COMMAND_STATUS remove_all_nfs_network_ac_ls_on_share_post(remove_all_nfs_network_ac_ls_on_share_param)

Remove All network ACLs from NFS share

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

api_instance = IFClient::NasApi.new

remove_all_nfs_network_ac_ls_on_share_param = IFClient::RemoveAllNFSNetworkACLsOnShareParam.new # RemoveAllNFSNetworkACLsOnShareParam | 


begin
  #Remove All network ACLs from NFS share
  result = api_instance.remove_all_nfs_network_ac_ls_on_share_post(remove_all_nfs_network_ac_ls_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_all_nfs_network_ac_ls_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_all_nfs_network_ac_ls_on_share_param** | [**RemoveAllNFSNetworkACLsOnShareParam**](RemoveAllNFSNetworkACLsOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_all_smb_network_ac_ls_on_project_post**
> COMMAND_STATUS remove_all_smb_network_ac_ls_on_project_post(remove_all_smb_network_ac_ls_on_project_param)

Remove All network ACLs from SMB Project

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

api_instance = IFClient::NasApi.new

remove_all_smb_network_ac_ls_on_project_param = IFClient::RemoveAllSMBNetworkACLsOnProjectParam.new # RemoveAllSMBNetworkACLsOnProjectParam | 


begin
  #Remove All network ACLs from SMB Project
  result = api_instance.remove_all_smb_network_ac_ls_on_project_post(remove_all_smb_network_ac_ls_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_all_smb_network_ac_ls_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_all_smb_network_ac_ls_on_project_param** | [**RemoveAllSMBNetworkACLsOnProjectParam**](RemoveAllSMBNetworkACLsOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_all_smb_network_ac_ls_on_share_post**
> COMMAND_STATUS remove_all_smb_network_ac_ls_on_share_post(remove_all_smb_network_ac_ls_on_share_param)

Remove All network ACLs from SMB share

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

api_instance = IFClient::NasApi.new

remove_all_smb_network_ac_ls_on_share_param = IFClient::RemoveAllSMBNetworkACLsOnShareParam.new # RemoveAllSMBNetworkACLsOnShareParam | 


begin
  #Remove All network ACLs from SMB share
  result = api_instance.remove_all_smb_network_ac_ls_on_share_post(remove_all_smb_network_ac_ls_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_all_smb_network_ac_ls_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_all_smb_network_ac_ls_on_share_param** | [**RemoveAllSMBNetworkACLsOnShareParam**](RemoveAllSMBNetworkACLsOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_nfs_network_acl_on_project_post**
> COMMAND_STATUS remove_nfs_network_acl_on_project_post(remove_nfs_network_acl_on_project_param)

Remove network ACL from NFS Project

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

api_instance = IFClient::NasApi.new

remove_nfs_network_acl_on_project_param = IFClient::RemoveNFSNetworkACLOnProjectParam.new # RemoveNFSNetworkACLOnProjectParam | 


begin
  #Remove network ACL from NFS Project
  result = api_instance.remove_nfs_network_acl_on_project_post(remove_nfs_network_acl_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_nfs_network_acl_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_nfs_network_acl_on_project_param** | [**RemoveNFSNetworkACLOnProjectParam**](RemoveNFSNetworkACLOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_nfs_network_acl_on_share_post**
> COMMAND_STATUS remove_nfs_network_acl_on_share_post(remove_nfs_network_acl_on_share_param)

Remove network ACL from NFS share

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

api_instance = IFClient::NasApi.new

remove_nfs_network_acl_on_share_param = IFClient::RemoveNFSNetworkACLOnShareParam.new # RemoveNFSNetworkACLOnShareParam | 


begin
  #Remove network ACL from NFS share
  result = api_instance.remove_nfs_network_acl_on_share_post(remove_nfs_network_acl_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_nfs_network_acl_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_nfs_network_acl_on_share_param** | [**RemoveNFSNetworkACLOnShareParam**](RemoveNFSNetworkACLOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_smb_network_acl_on_project_post**
> COMMAND_STATUS remove_smb_network_acl_on_project_post(remove_smb_network_acl_on_project_param)

Remove network ACL from SMB Project

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

api_instance = IFClient::NasApi.new

remove_smb_network_acl_on_project_param = IFClient::RemoveSMBNetworkACLOnProjectParam.new # RemoveSMBNetworkACLOnProjectParam | 


begin
  #Remove network ACL from SMB Project
  result = api_instance.remove_smb_network_acl_on_project_post(remove_smb_network_acl_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_smb_network_acl_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_smb_network_acl_on_project_param** | [**RemoveSMBNetworkACLOnProjectParam**](RemoveSMBNetworkACLOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_smb_network_acl_on_share_post**
> COMMAND_STATUS remove_smb_network_acl_on_share_post(remove_smb_network_acl_on_share_param)

Remove network ACL from SMB share

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

api_instance = IFClient::NasApi.new

remove_smb_network_acl_on_share_param = IFClient::RemoveSMBNetworkACLOnShareParam.new # RemoveSMBNetworkACLOnShareParam | 


begin
  #Remove network ACL from SMB share
  result = api_instance.remove_smb_network_acl_on_share_post(remove_smb_network_acl_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->remove_smb_network_acl_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **remove_smb_network_acl_on_share_param** | [**RemoveSMBNetworkACLOnShareParam**](RemoveSMBNetworkACLOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_nfs_network_ac_ls_on_project_post**
> COMMAND_STATUS set_nfs_network_ac_ls_on_project_post(set_nfs_network_ac_ls_on_project_param)

Set the network ACLS on the NFS Project If the dataset contains any network ACLs, they will be removed as well.

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

api_instance = IFClient::NasApi.new

set_nfs_network_ac_ls_on_project_param = IFClient::SetNFSNetworkACLsOnProjectParam.new # SetNFSNetworkACLsOnProjectParam | 


begin
  #Set the network ACLS on the NFS Project If the dataset contains any network ACLs, they will be removed as well.
  result = api_instance.set_nfs_network_ac_ls_on_project_post(set_nfs_network_ac_ls_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_nfs_network_ac_ls_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_nfs_network_ac_ls_on_project_param** | [**SetNFSNetworkACLsOnProjectParam**](SetNFSNetworkACLsOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_nfs_network_ac_ls_on_share_post**
> COMMAND_STATUS set_nfs_network_ac_ls_on_share_post(set_nfs_network_ac_ls_on_share_param)

Set the network ACLS on the NFS share. If the dataset contains any network ACLs, they will be removed as well.

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

api_instance = IFClient::NasApi.new

set_nfs_network_ac_ls_on_share_param = IFClient::SetNFSNetworkACLsOnShareParam.new # SetNFSNetworkACLsOnShareParam | 


begin
  #Set the network ACLS on the NFS share. If the dataset contains any network ACLs, they will be removed as well.
  result = api_instance.set_nfs_network_ac_ls_on_share_post(set_nfs_network_ac_ls_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_nfs_network_ac_ls_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_nfs_network_ac_ls_on_share_param** | [**SetNFSNetworkACLsOnShareParam**](SetNFSNetworkACLsOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_nfs_sharing_on_project_post**
> COMMAND_STATUS set_nfs_sharing_on_project_post(set_nfs_sharing_on_project_param)

Enable/Disable NFS protocol for a Project

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

api_instance = IFClient::NasApi.new

set_nfs_sharing_on_project_param = IFClient::SetNFSSharingOnProjectParam.new # SetNFSSharingOnProjectParam | 


begin
  #Enable/Disable NFS protocol for a Project
  result = api_instance.set_nfs_sharing_on_project_post(set_nfs_sharing_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_nfs_sharing_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_nfs_sharing_on_project_param** | [**SetNFSSharingOnProjectParam**](SetNFSSharingOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_nfs_sharing_on_share_post**
> COMMAND_STATUS set_nfs_sharing_on_share_post(set_nfs_sharing_on_share_param)

Enable/Disable NFS protocol for a share. If the dataset contains any network ACLs, they will be removed as well.

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

api_instance = IFClient::NasApi.new

set_nfs_sharing_on_share_param = IFClient::SetNFSSharingOnShareParam.new # SetNFSSharingOnShareParam | 


begin
  #Enable/Disable NFS protocol for a share. If the dataset contains any network ACLs, they will be removed as well.
  result = api_instance.set_nfs_sharing_on_share_post(set_nfs_sharing_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_nfs_sharing_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_nfs_sharing_on_share_param** | [**SetNFSSharingOnShareParam**](SetNFSSharingOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_smb_config_post**
> COMMAND_STATUS set_smb_config_post(set_smb_config_param)

Set SMB configuration

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

api_instance = IFClient::NasApi.new

set_smb_config_param = IFClient::SetSMBConfigParam.new # SetSMBConfigParam | 


begin
  #Set SMB configuration
  result = api_instance.set_smb_config_post(set_smb_config_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_smb_config_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_smb_config_param** | [**SetSMBConfigParam**](SetSMBConfigParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_smb_network_ac_ls_on_project_post**
> COMMAND_STATUS set_smb_network_ac_ls_on_project_post(set_smb_network_ac_ls_on_project_param)

Set the network ACLS on the SMB Project If the dataset contains any network ACLs, they will be removed as well.

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

api_instance = IFClient::NasApi.new

set_smb_network_ac_ls_on_project_param = IFClient::SetSMBNetworkACLsOnProjectParam.new # SetSMBNetworkACLsOnProjectParam | 


begin
  #Set the network ACLS on the SMB Project If the dataset contains any network ACLs, they will be removed as well.
  result = api_instance.set_smb_network_ac_ls_on_project_post(set_smb_network_ac_ls_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_smb_network_ac_ls_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_smb_network_ac_ls_on_project_param** | [**SetSMBNetworkACLsOnProjectParam**](SetSMBNetworkACLsOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_smb_network_ac_ls_on_share_post**
> COMMAND_STATUS set_smb_network_ac_ls_on_share_post(set_smb_network_ac_ls_on_share_param)

Set the network ACLS on the SMB share. If the dataset contains any network ACLs, they will be removed as well.

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

api_instance = IFClient::NasApi.new

set_smb_network_ac_ls_on_share_param = IFClient::SetSMBNetworkACLsOnShareParam.new # SetSMBNetworkACLsOnShareParam | 


begin
  #Set the network ACLS on the SMB share. If the dataset contains any network ACLs, they will be removed as well.
  result = api_instance.set_smb_network_ac_ls_on_share_post(set_smb_network_ac_ls_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_smb_network_ac_ls_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_smb_network_ac_ls_on_share_param** | [**SetSMBNetworkACLsOnShareParam**](SetSMBNetworkACLsOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_smb_sharing_on_project_post**
> COMMAND_STATUS set_smb_sharing_on_project_post(set_smb_sharing_on_project_param)

Enable/Disable SMB protocol for a Project, If the dataset contains any network ACLs, they are removed as well.

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

api_instance = IFClient::NasApi.new

set_smb_sharing_on_project_param = IFClient::SetSMBSharingOnProjectParam.new # SetSMBSharingOnProjectParam | 


begin
  #Enable/Disable SMB protocol for a Project, If the dataset contains any network ACLs, they are removed as well.
  result = api_instance.set_smb_sharing_on_project_post(set_smb_sharing_on_project_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_smb_sharing_on_project_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_smb_sharing_on_project_param** | [**SetSMBSharingOnProjectParam**](SetSMBSharingOnProjectParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **set_smb_sharing_on_share_post**
> COMMAND_STATUS set_smb_sharing_on_share_post(set_smb_sharing_on_share_param)

Enable/Disable SMB protocol for a share. If the dataset contains any network ACLs, they will be removed as well.

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

api_instance = IFClient::NasApi.new

set_smb_sharing_on_share_param = IFClient::SetSMBSharingOnShareParam.new # SetSMBSharingOnShareParam | 


begin
  #Enable/Disable SMB protocol for a share. If the dataset contains any network ACLs, they will be removed as well.
  result = api_instance.set_smb_sharing_on_share_post(set_smb_sharing_on_share_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NasApi->set_smb_sharing_on_share_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **set_smb_sharing_on_share_param** | [**SetSMBSharingOnShareParam**](SetSMBSharingOnShareParam.md)|  | 

### Return type

[**COMMAND_STATUS**](COMMAND_STATUS.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



