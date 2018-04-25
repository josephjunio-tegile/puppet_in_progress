# IFClient::GetShareSnapshotCreationStatusParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | Dataset path of the share. The dataset path has the format: PoolName/Local/ProjectName/ShareName.  You can get the datasetPath from the listShares API. For more information, see listShares and Share_V1_0.datasetPath.  | 
**arg1_snapshotd_name** | **String** | Name of the share snapshot for which status is required. You must use the name that you specified while invoking the createShareSnapshot API, because this API prefixes the string \&quot;Manual-S-\&quot; to the name before getting the status.  | 


