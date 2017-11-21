# IFClient::ReplicationApi

All URIs are relative to *https://intelliflash/zebi/api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_replication_config_list_post**](ReplicationApi.md#get_replication_config_list_post) | **POST** /getReplicationConfigList | Lists all the replication configurations for the specified project.
[**get_replication_status_post**](ReplicationApi.md#get_replication_status_post) | **POST** /getReplicationStatus | Gets the replication status for the specified replication configuration.
[**start_replication_post**](ReplicationApi.md#start_replication_post) | **POST** /startReplication | Starts a replication for the specified replication configuration.


# **get_replication_config_list_post**
> Array&lt;ReplicationConfigV12&gt; get_replication_config_list_post(get_replication_config_list_param)

Lists all the replication configurations for the specified project.

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

api_instance = IFClient::ReplicationApi.new

get_replication_config_list_param = IFClient::GetReplicationConfigListParam.new # GetReplicationConfigListParam | 


begin
  #Lists all the replication configurations for the specified project.
  result = api_instance.get_replication_config_list_post(get_replication_config_list_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling ReplicationApi->get_replication_config_list_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_replication_config_list_param** | [**GetReplicationConfigListParam**](GetReplicationConfigListParam.md)|  | 

### Return type

[**Array&lt;ReplicationConfigV12&gt;**](ReplicationConfigV12.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_replication_status_post**
> ReplicationStatusV12 get_replication_status_post(get_replication_status_param)

Gets the replication status for the specified replication configuration.

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

api_instance = IFClient::ReplicationApi.new

get_replication_status_param = IFClient::GetReplicationStatusParam.new # GetReplicationStatusParam | 


begin
  #Gets the replication status for the specified replication configuration.
  result = api_instance.get_replication_status_post(get_replication_status_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling ReplicationApi->get_replication_status_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_replication_status_param** | [**GetReplicationStatusParam**](GetReplicationStatusParam.md)|  | 

### Return type

[**ReplicationStatusV12**](ReplicationStatusV12.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **start_replication_post**
> start_replication_post(start_replication_param)

Starts a replication for the specified replication configuration.

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

api_instance = IFClient::ReplicationApi.new

start_replication_param = IFClient::StartReplicationParam.new # StartReplicationParam | 


begin
  #Starts a replication for the specified replication configuration.
  api_instance.start_replication_post(start_replication_param)
rescue IFClient::ApiError => e
  puts "Exception when calling ReplicationApi->start_replication_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_replication_param** | [**StartReplicationParam**](StartReplicationParam.md)|  | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



