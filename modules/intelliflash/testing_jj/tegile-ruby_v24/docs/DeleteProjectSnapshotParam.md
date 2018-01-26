# IFClient::DeleteProjectSnapshotParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_project_snapshot_path** | **String** | Dataset path of the project snapshot. The dataset path of a project snapshot has the following format: PoolName/Local/ProjectName@SnapshotName. You can get the snapshotPath from the listSnapshots API. For more information, see listSnapshots.  | 
**arg1_recursive** | **BOOLEAN** | A boolean value that specifies whether dependents of the snapshot are deleted before the snapshot is deleted.  | 


