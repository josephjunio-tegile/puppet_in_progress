# IFClient::RollBackToProjectSnapshotParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_snapshot_path** | **String** | Path of the project-level snapshot that has to be rolled back. The snapshot path has the format: PoolName/Local/ProjectName@SnapshotName. You can get the snapshotPath from the listSnapshots API. For more information, see listSnapshots.  | 
**arg1_delete_dependents** | **BOOLEAN** | A boolean value: indicates whether to delete the snapshot dependents. If the deleteDependents is set to false and rollback is invoked, the method throws an error if there are existing dependents for the snapshot.  | 


