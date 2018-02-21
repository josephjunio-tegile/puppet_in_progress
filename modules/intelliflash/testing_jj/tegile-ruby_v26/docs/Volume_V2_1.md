# IFClient::Volume_V2_1

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
**compression_class** | [**CompressionClass**](CompressionClass.md) |  | [optional] 
**name** | **String** | Name of the subproject | 
**guid** | **String** | Global unique identifier of the sub project | [optional] 
**override_compression** | **BOOLEAN** | Toggle override parent project compression algorithm | [optional] 
**reservation_in_byte** | **Integer** | Reserved space number of the sub project | [optional] 
**reservation** | **Float** | Reserved space in reserved space metric unit of the sub project | [optional] 
**reservation_metric** | **String** | reserved space metric unit of the sub project | [optional] 
**reservation_enabled** | **BOOLEAN** | Enable reservation feature | [optional] 
**override_dedup** | **BOOLEAN** | Toggle overwrite parent project deduplication | [optional] 
**override_copies** | **BOOLEAN** | Toggle overwrite copies of parent project | [optional] 
**override_primary_cache** | **BOOLEAN** | Toggle overwrite parent project primary cache | [optional] 
**override_secondary_cache** | **BOOLEAN** | Toggle overwrite parent project secondary cache | [optional] 
**override_readonly** | **BOOLEAN** | Toggle overwrite parent readonly feature | [optional] 
**override_logbias** | **BOOLEAN** | Toggle overwrite parent project log bias | [optional] 
**override_sync** | **BOOLEAN** | Toggle synchronization mode of the sub project | [optional] 
**override_project_snapshot_settings** | **BOOLEAN** | Toggle overwrite parent project snapshot setting | [optional] 
**override_compressed_log** | **BOOLEAN** | Toggle overwrite project parent log compression | [optional] 
**container_name** | **String** | The name of the container, \&quot;Local\&quot; or \&quot;Replica\&quot; | [optional] 
**vol_size** | **Integer** | Volume size in bytes | [optional] 
**lu_id** | **String** | The unique identifier for the lun. The luId is not required for createVolume API. | [optional] 
**used_size** | **Integer** | Used size in bytes | [optional] 
**thin_provisioning** | **BOOLEAN** | Indicates whether this volume is thin provisioned or thick provisioned. | [optional] 
**block_size** | [**BlockSize_enum**](BlockSize_enum.md) |  | [optional] 
**write_back_cache** | **String** | Toggle write back cache | [optional] 
**override_views** | **BOOLEAN** | Toggle override parent project initiator-target mapping views | [optional] 
**protocol** | **String** | This is the protocol on which the volume will be exposed. The valid values are iSCSI, FC, and Unknown. | [optional] 


