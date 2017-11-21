# IFClient::LunStatus

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**access_state** | **Integer** | indicating whether the LUN is:   active (0)   active to standby (1)   standby (2)   standby to active (3)  | [optional] 
**_alias** | **String** | The LUN alias, if specified. | [optional] 
**block_size** | **String** | The block size of the LUN. | [optional] 
**command_exception** | [**ErrorModel**](ErrorModel.md) |  | [optional] 
**command_status** | [**COMMANDSTATUS**](COMMANDSTATUS.md) |  | [optional] 
**data_file** | **String** | The data file path for the LUN. | [optional] 
**dataset_path** | **String** | The path to the dataset. The dataset path should have the format PoolName/Local/ProjectName/VolumeName for LUNs.  | [optional] 
**guid** | **String** | The lunId of the LUN. | [optional] 
**meta_file** | **String** | The meta file path of the LUN. | [optional] 
**mgmt_url** | **String** | The management URL of the LUN. | [optional] 
**operational_status** | **Integer** | Operational status of the LU.     Stmf (SCSI target mode framework) logical unit offline (0)     Stmf logical unit offlining (1)     Stmf logical unit online (2)     Stmf logical unit onlining (3)     Stmf logical unit unregistered (4)  | [optional] 
**product_id** | **String** | Field not used. | [optional] 
**serial_number** | **String** | Field not used. | [optional] 
**size** | **String** | The size of the LUN. | [optional] 
**vendor_id** | **String** | Field not used. | [optional] 
**view_count** | **Integer** | The number of mappings defined for the LUN. | [optional] 
**write_cache_disable** | **BOOLEAN** | Indicates if the data write cache is disabled. | [optional] 
**write_protect** | **BOOLEAN** | Indicates if write protect is enabled or disabled.   Read-Only (True)   Write (False)  | [optional] 


