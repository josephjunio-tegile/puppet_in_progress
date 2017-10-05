# IFClient::ISCSITargetCreateV21

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**target_suffix_name** | **String** | Target suffix, or user specified portion of the iSCSI target name after the iqn colon  (e.g. iqn.2012-12.com.tegile:targetSuffixName)  | [optional] 
**target_alias** | **String** | Target Alias, as alternate user friendly name of target (often same as target name suffix) | [optional] 
**target_group_name** | **String** | Target Group Name | [optional] 
**target_authentication_mode** | **String** | Target Authentication type. Must be &#39;none&#39;, &#39;chap&#39;, or &#39;mutual&#39; string names.   none - indicates no user or password needed   chap - indicates one way authentication, no user or password needed   mutual - two way authentication, supply chap user and secret  | [optional] 
**target_chap_name** | **String** | User name for the chap authentication. Only required if &#39;mutual&#39; chap authentication was chosen.        | [optional] 
**target_chap_secret** | **String** | Password for the chap authentication. Only required if &#39;mutual&#39; chap authentication was chosen.  | [optional] 
**target_network_binding** | **Array&lt;String&gt;** | Network Binding ip:port string indicating the network ports to bind target with. | [optional] 


