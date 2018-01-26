# IFClient::Project_V2_1

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**project_name** | **String** | Name of the project. | 
**pool_name** | **String** | The pool in which the project exists. | 
**local_dataset** | **BOOLEAN** | Indicates whether the project belongs to the current Tegile array. | 
**purpose** | **String** | Purpose of the dataset. | [optional] 
**compression** | **String** | Compression algorithm, default value: \&quot;lz4\&quot;   | [optional] 
**compressed_log** | **String** | Log compression, default value : \&quot;off\&quot;  | [optional] 
**dedup** | **String** | Deduplication setting, default value: \&quot;on\&quot;  | [optional] 
**copies** | **String** | Number of data copies, default value: \&quot;1\&quot;  | [optional] 
**primary_cache** | **String** | Primary cache specified, default value: \&quot;all\&quot;  | [optional] 
**secondary_cache** | **String** | Secondary cache specified, default value: \&quot;all\&quot;  | [optional] 
**readonly** | **String** | Read only flag, default value: \&quot;off\&quot;  | [optional] 
**logbias** | **String** | Prejudice in favor of log, default value: \&quot;latency\&quot;  | [optional] 
**sync** | **String** | synchronization mode, default value: \&quot;standard\&quot;   | [optional] 
**zfs_data_set_name** | **String** | This field is a string that uniquely identifies the volume on a Tegile array. A dataset path should have the format: PoolName/Local/ProjectName  | [optional] 
**mount_point** | **String** | Mount point of project | [optional] 
**intended_protocol_list** | **Array&lt;String&gt;** | list of protocols that project supports | [optional] 
**quota_in_byte** | **Integer** | Space limitation of datasets in the project | [optional] 
**quota_enabled** | **BOOLEAN** | Enable quota feature | [optional] 
**acl_inherit** | **String** | toggle Access Control List inherit from pool setting, default value: \&quot;on\&quot;  | [optional] 
**acl_mode** | **String** | Access Control List mode, default value: \&quot;passthrough\&quot;  | [optional] 
**krb_status** | **BOOLEAN** | Kerberos status default value: false   | [optional] 
**default_volume_size_in_byte** | **Integer** | default SAN volume size in byte, default value: 1 (GB), Minimun Size: 1MB (1048576 bytes)  | [optional] 
**default_volume_block_size** | [**BlockSize_enum**](BlockSize_enum.md) |  | [optional] 
**default_thin_provisioning** | **BOOLEAN** | Default thin provisioning flag, default value: false   | [optional] 
**record_size** | [**BlockSize_enum**](BlockSize_enum.md) |  | [optional] 
**quota** | **Float** | Quota in quotaMetric unit | [optional] 
**quota_metric** | **String** | Units used for quota. | [optional] 
**default_volume_size** | **Float** | Default size of a new Volume in the unit of defaultVolumeSizeUnit | [optional] 
**default_volume_size_unit** | **String** | Units used for defaultVolumeSize | [optional] 


