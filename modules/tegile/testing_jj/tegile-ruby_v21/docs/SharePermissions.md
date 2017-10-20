# IFClient::SharePermissions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**group_list** | [**Array&lt;LocalGroupV12&gt;**](LocalGroupV12.md) |  | [optional] 
**share_permission_enum** | [**PermissionTypeEnum**](PermissionTypeEnum.md) |  | [optional] 
**share_permission_mode** | [**ModeEnum**](ModeEnum.md) |  | [optional] 
**user_list** | [**Array&lt;LocalUserV12&gt;**](LocalUserV12.md) | Array of LocalUser_V1_2 objects A JSON array of LocalUser_V1_2 object.  You can use the response of the listUsers method for this parameter.  This will be used if the sharePermissionEnum parameter (Permission_type_enum) is set to USER.  | [optional] 


