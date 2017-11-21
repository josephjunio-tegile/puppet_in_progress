# IFClient::CreateMappingForProjectParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | The dataset path of the project. The dataset path has the format: PoolName/Local/ProjectName. You can get the datasetPath from the listProjects API. For more information, see listProjects.  | 
**arg1_initiator_group_name** | **String** | The name of the initiator group to which the volume must be mapped. | 
**arg2_target_group_name** | **String** | The name of the target group to which the volume must be mapped. | 
**arg3_read_only** | **BOOLEAN** | True if mapping to be read only, false if not | 


