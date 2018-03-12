# IFClient::DeleteShareParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | The path which uniquely identifies the share.  The dataset path has the format: PoolName/Local/ProjectName/ShareName.  You can get the datasetPath from the listShares API.  For more information, see listShares and Share_V1_0.datasetPath.  | 
**arg1_recursive** | **BOOLEAN** | A true specifies that dependents of the share should be deleted before deleting the share or not (false).  | 
**arg2_error_if_not_exist** | **BOOLEAN** | Indicates whether to raise (if true) an exception if the path specified by datasetPath does not exist.  | 


