# IFClient::DeleteVolumeSnapshotParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_volume_snapshot_path** | **String** | Dataset path of the volume snapshot.  The dataset path of a volume snapshot has the following format: PoolName/Local/ProjectName@SnapshotName. You can get the snapshotPath from the listSnapshots API. For more information, see listSnapshots.  | 
**arg1_recursive** | **BOOLEAN** | A boolean value that specifies whether dependents of the snapshot are deleted before the snapshot is deleted.  | 


