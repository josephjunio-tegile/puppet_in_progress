# IFClient::InheritPropertyFromProjectParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_dataset_path** | **String** | A string that contains the dataset path.  The dataset path has the format: PoolName/Local/ProjectName/VolumeName. You can get the datasetPath from the listVolumes/listShares API.   | 
**arg1_prop_name** | **String** | Available properties inherited from project include:   Common:    Compression    Dedup    Copies    PrimaryCache    SecondaryCache    Readonly    Logbias    Sync    CompressedLog    ProjectSnapshotSettings       Share only:    MountPoint    Sharenfs    Sharesmb    AclInherit    Volume only:    Views Indicates whether to copy the view settings related to the intended protocol (iSCSI or FC) from  the project. The default views created on the project are copied over if this parameter is true.  If this parameter is false, then the volume is created with no views attached to it.  | 


