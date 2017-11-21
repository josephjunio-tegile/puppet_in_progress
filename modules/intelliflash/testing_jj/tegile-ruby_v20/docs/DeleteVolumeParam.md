# IFClient::DeleteVolumeParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | The path which uniquely identifies the volume on the Tegile array.  The dataset path has the format: PoolName/Local/ProjectName/VolumeName.  You can get the datasetPath from the listVolumes API.  For more information, see listVolumes and Volume_V1_0.datasetPath.  | 
**arg1_recursive** | **BOOLEAN** | Indicates whether the dependents (for example, clones of the dataset) of the dataset  should be removed (if true) before trying to delete the dataset.  This API fails if you try to delete a volume that has dependents and the recursive parameter is set to false.  | 
**arg2_error_if_not_exist** | **BOOLEAN** | Indicates whether to raise (if true) an exception if the path specified by datasetPath does not exist.  | 


