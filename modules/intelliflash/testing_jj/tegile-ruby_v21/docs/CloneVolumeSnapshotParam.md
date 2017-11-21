# IFClient::CloneVolumeSnapshotParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_snapshot_path** | **String** | The snapshot path of the volume dataset to be cloned. The snapshot path has the format: PoolName/Local/ProjectName/VolumeName@SnapshotName. You can get the snapshotPath from the listSnapshots API. For more information, see listSnapshots.  | 
**arg1_clone_name** | **String** | A string that is used to create the name of the new dataset. The clone name is appended to the resultant volume name. The characters ,, /,\\\\, !, ?, @, &lt;, &gt;, #, $, &#39;,%, ^,*,(, ), ~,+, &#x3D;, },|, :, {, [, ], ;, \\&#39;, \\\&quot;, &amp; are not allowed in clonename.  The empty and space characters and the null values are not allowed in clonename.  | 
**arg2_inherit_views_from_volume** | **BOOLEAN** | A boolean value that indicates whether the new dataset will inherit views from the volume.  | 
**arg3_inherit_views_from_project** | **BOOLEAN** | A boolean value that indicates whether the new dataset will inherit views from the project.  | 
**arg4_protocol** | **BOOLEAN** | A boolean value that indicates protocol to be set for the clone. Valid values are true for iSCSI and false for FC.  | 


