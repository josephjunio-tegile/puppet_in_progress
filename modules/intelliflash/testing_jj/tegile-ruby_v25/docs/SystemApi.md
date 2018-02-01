# IFClient::SystemApi

All URIs are relative to *https://intelliflash/zebi/api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_system_properties_post**](SystemApi.md#list_system_properties_post) | **POST** /listSystemProperties | Lists values of the requested system properties for a Tegile array.


# **list_system_properties_post**
> Array&lt;String&gt; list_system_properties_post(list_system_properties_param)

Lists values of the requested system properties for a Tegile array.

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

api_instance = IFClient::SystemApi.new

list_system_properties_param = IFClient::ListSystemPropertiesParam.new # ListSystemPropertiesParam | 


begin
  #Lists values of the requested system properties for a Tegile array.
  result = api_instance.list_system_properties_post(list_system_properties_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling SystemApi->list_system_properties_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_system_properties_param** | [**ListSystemPropertiesParam**](ListSystemPropertiesParam.md)|  | 

### Return type

**Array&lt;String&gt;**

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



