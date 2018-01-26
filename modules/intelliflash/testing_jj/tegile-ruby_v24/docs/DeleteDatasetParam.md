# IFClient::DeleteDatasetParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | The path to the dataset. The dataset path has the format: PoolName/Local/ProjectName/VolumeName.  | 
**arg1_recursive** | **BOOLEAN** | Indicates whether the dependents (for example clones of the dataset) of this dataset should be removed (if true) before trying to delete the dataset or not (if false).  Deletion might fail if the dataset has dependents.  | 
**arg2_error_if_not_exist** | **BOOLEAN** | Indicates whether to raise (if true) an exception if the path specified by datasetPath does not exist.  | 


