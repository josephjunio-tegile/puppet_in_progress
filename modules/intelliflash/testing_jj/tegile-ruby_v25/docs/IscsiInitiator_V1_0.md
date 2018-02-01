# IFClient::IscsiInitiator_V1_0

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**chap_secret** | **String** | Optional CHAP secret if the initiator uses CHAP for authentication. | [optional] 
**chap_user_name** | **String** | Optional CHAP username if the initiator uses CHAP for authentication. | [optional] 
**initiator_name** | **String** | Standard initiator names can have either of these two formats:   iqn.yyyy-mm.[reverse-domain-name]   eui.02004567A425678D (EUI-64 identifier - 16 ASCII-encoded hexadecimal digits) The characters ,, /,\\\\, !, ?, @, &lt;, &gt;, #, $, &#39;, %, ^, *, (, ), ~, +, &#x3D;, }, |, {, [, ], ;, &#39;, \&quot;, _, &amp;  are not allowed in initiatorgroupname. The empty and space characters and the null values are not allowed in initiatorgroupname.  | 


