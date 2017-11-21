# IFClient::GetVolumeSnapshotCreationStatusParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | Dataset path of the volume. The dataset path has the format: PoolName/Local/ProjectName/VolumeName.  You can get the datasetPath from the listVolumes API. For more information, see listVolumes and Volume_V1_0.datasetPath.  | 
**arg1_snapshotd_name** | **String** | Name of the volume snapshot for which status is required. You must use the name that you specified while invoking the createVolumeSnapshot API, because this API prefixes the string \&quot;Manual-V-\&quot; to the name before getting the status.  | 


