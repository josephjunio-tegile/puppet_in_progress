# IFClient::BaseDatasetV21

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


