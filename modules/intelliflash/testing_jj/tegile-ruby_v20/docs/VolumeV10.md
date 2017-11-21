# IFClient::VolumeV10

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**block_size** | [**BlockSizeEnum**](BlockSizeEnum.md) |  | [optional] 
**dataset_path** | **String** | This field is a string that uniquely identifies the volume on a Tegile array. A dataset path should have the format: PoolName/Local/ProjectName /VolumeName. You can get the datasetPath from the listVolumes API. For more information, see listVolumes. The datasetPath is not required for createVolume API.&#39;  | [optional] 
**local** | **BOOLEAN** | This boolean identifies whether the volume belongs to a local project or a replicated project. The local boolean is not required for createVolume API. | [optional] 
**lu_id** | **String** | The unique identifier for the lun. The luId is not required for createVolume API. | [optional] 
**name** | **String** | Name of the volume. | [optional] 
**pool_name** | **String** | The pool that contains this volume. | [optional] 
**project_name** | **String** | The project that contains this volume. | [optional] 
**protocol** | **String** | This is the protocol on which the volume will be exposed. The valid values are iSCSI, FC, and Unknown. | [optional] 
**thin_provision** | **BOOLEAN** | Indicates whether this volume is thin provisioned or thick provisioned. | [optional] 
**vol_size** | **Integer** | The size of the volume in bytes. | [optional] 


