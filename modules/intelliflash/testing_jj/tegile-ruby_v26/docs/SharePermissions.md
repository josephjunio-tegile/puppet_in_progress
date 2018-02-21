# IFClient::SharePermissions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**group_list** | [**Array&lt;LocalGroup_V1_2&gt;**](LocalGroup_V1_2.md) |  | [optional] 
**share_permission_enum** | [**Permission_type_enum**](Permission_type_enum.md) |  | [optional] 
**share_permission_mode** | [**Mode_enum**](Mode_enum.md) |  | [optional] 
**user_list** | [**Array&lt;LocalUser_V1_2&gt;**](LocalUser_V1_2.md) | Array of LocalUser_V1_2 objects A JSON array of LocalUser_V1_2 object.  You can use the response of the listUsers method for this parameter.  This will be used if the sharePermissionEnum parameter (Permission_type_enum) is set to USER.  | [optional] 


