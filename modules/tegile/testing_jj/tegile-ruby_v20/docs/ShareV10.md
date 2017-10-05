# IFClient::ShareV10

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**available_size** | **Integer** | The available size of the share in bytes. | [optional] 
**dataset_path** | **String** | This field is a string that uniquely identifies the share on a Tegile array.  A dataset path should have the format: PoolName/Local/ProjectName/ShareName.  | [optional] 
**local** | **BOOLEAN** | Identifies whether the share belongs to a local project or a replicated project. | [optional] 
**mountpoint** | **String** | This string exposes the mountpoint of the share on a Tegile array. | [optional] 
**name** | **String** | Name of the share. | [optional] 
**pool_name** | **String** | The pool that contains this share. | [optional] 
**project_name** | **String** | The project that contains this share. | [optional] 
**total_size** | **Integer** | The total size of the share in bytes. | [optional] 


