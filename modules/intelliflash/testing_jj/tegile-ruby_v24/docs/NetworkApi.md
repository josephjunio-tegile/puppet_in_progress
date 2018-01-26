# IFClient::NetworkApi

All URIs are relative to *https://intelliflash/zebi/api/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_floating_ip_list_post**](NetworkApi.md#get_floating_ip_list_post) | **POST** /getFloatingIPList | Specify the target pool name.


# **get_floating_ip_list_post**
> Array&lt;FloatingIP_V2_2&gt; get_floating_ip_list_post(get_floating_ip_list_param)

Specify the target pool name.

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

api_instance = IFClient::NetworkApi.new

get_floating_ip_list_param = IFClient::GetFloatingIPListParam.new # GetFloatingIPListParam | 


begin
  #Specify the target pool name.
  result = api_instance.get_floating_ip_list_post(get_floating_ip_list_param)
  p result
rescue IFClient::ApiError => e
  puts "Exception when calling NetworkApi->get_floating_ip_list_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_floating_ip_list_param** | [**GetFloatingIPListParam**](GetFloatingIPListParam.md)|  | 

### Return type

[**Array&lt;FloatingIP_V2_2&gt;**](FloatingIP_V2_2.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



