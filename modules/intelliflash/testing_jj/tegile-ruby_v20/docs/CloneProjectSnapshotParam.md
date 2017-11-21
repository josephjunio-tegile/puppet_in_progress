# IFClient::CloneProjectSnapshotParam

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**arg0_snapshot_path** | **String** | Path of the project-level snapshot that has to be cloned. The snapshot path has the format: PoolName/Local/ProjectName@SnapshotName.  You can get the snapshotPath from the listSnapshots API. For more information, see listSnapshots.  | 
**arg1_clone_name** | **String** | A string that is used to create names of the new datasets.  The clone name is appended to the resultant share and volume names. The characters ,, /,\\\\, !, ?, @, &lt;, &gt;, #, $, &#39;,%, ^,*,(, ), ~,+, &#x3D;, },|, :, {, [, ], ;, \\&#39;, \\\&quot;, &amp; are not allowed in clonename.  The empty and space characters and the null values are not allowed in clonename.  | 
**arg2_inherit_project_settings** | **BOOLEAN** | A boolean value that indicates whether the new dataset will inherit project settings.  | 


