# IFClient::CreateMappingForVolumeParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | The dataset path of the volume. The dataset path has the format: PoolName/Local/ProjectName/VolumeName. You can get the datasetPath from the listVolumes API. For more information, see listVolumes and Volume_V1_0.datasetPath.  | 
**arg1_initiator_group_name** | **String** | The name of the initiator group to which the volume must be mapped. | 
**arg2_target_group_name** | **String** | The name of the target group to which the volume must be mapped. | 
**arg3_lun_number** | **Integer** | Used as the LUN number for the newly defined LUN. To assign a LUN number automatically (default), use the value -1.  | 
**arg4_read_only** | **BOOLEAN** | True if mapping to be read only, false if not | 


