# IFClient::GetProjectSnapshotCreationStatusParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | Dataset path of the project. The dataset path has the format: PoolName/Local/ProjectName.  You can get the datasetPath from the listProjects API. For more information, see listProjects.  | 
**arg1_snapshotd_name** | **String** | Name of the project snapshot for which status is required. You must use the name that you specified while invoking the createProjectSnapshot API, because this API prefixes the string \&quot;Manual-P-\&quot; to the name before getting the status.  | 


