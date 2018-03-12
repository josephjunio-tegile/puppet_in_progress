# IFClient::Share_V2_1

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
**override_mount_point** | **BOOLEAN** | Toggle override parent project mount point | [optional] 
**quota_in_byte** | **Integer** | Space limitation of datasets in the project | [optional] 
**quota** | **Float** | Space limitation of datasets in the project in the unit of quotaMetric | [optional] 
**quota_metric** | **String** | Quota metric unit in share | [optional] 
**quota_enabled** | **BOOLEAN** | Enable quota feature | [optional] 
**mount_point** | **String** | Mount point of the share, Notice: SMB/NFS share has to be turned off to change mountpoint.  | [optional] 
**available_size** | **String** | Available size in bytes | [optional] 
**total_size** | **String** | Total size in bytes | [optional] 
**override_sharenfs** | **BOOLEAN** | Toggle override parent project share nfs | [optional] 
**override_sharesmb** | **BOOLEAN** | Toggle override parent project share smb | [optional] 
**krb_status** | **BOOLEAN** | Kerberos status of the share | [optional] 
**cifs_display_name** | **String** | CIFS display name. For CIFS share a custom display name can be used, otherwise default to projectName_shareName.  | [optional] 
**guest_status** | **BOOLEAN** | Guest status of the share | [optional] 
**acl_inherit** | **String** | Access Control List inherit from project setting. Notice: overrideAclInherit must be set to true before change it to a different value  | [optional] 
**override_acl_inherit** | **BOOLEAN** | Toggle Access Control List inherit from project setting | [optional] 
**record_size** | [**BlockSize_enum**](BlockSize_enum.md) |  | [optional] 
**override_record_size** | **BOOLEAN** | Indicate if record size is inheriting or overriding from project. | [optional] 
**atime** | **String** | Toggle access time, \&quot;on\&quot; or \&quot;off\&quot; | [optional] 
**nbmand** | **String** | Toggle nonblocking mandatory locks, \&quot;on\&quot; or \&quot;off\&quot; | [optional] 
**acl_list** | [**Array&lt;UserACL_V2_1&gt;**](UserACL_V2_1.md) | Sser Access Control List | [optional] 


