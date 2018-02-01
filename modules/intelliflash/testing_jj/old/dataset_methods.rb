require 'tegile-api'

IFClient.configure do |config|
    # Configure HTTP basic authorization: basicAuth
    config.username = "admin"
    config.password = "tegile1"
    config.host = "10.65.3.30"
    config.verify_ssl = false
end

def get_share(project_name,share_name)
    api_instance = IFClient::DataApi.new
    get_share_param = IFClient::GetShareParam.new
    get_share_param.arg0_dataset_path = "pool-a/Local/#{project_name}/#{share_name}"
    begin
        #Get the Share details.
        result = api_instance.get_share_post(get_share_param)
        puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->get_share: #{error.inspect}"
    end
    
end

def create_share(project_name,share_name)
    api_instance = IFClient::DataApi.new

        ##Set share option params
    new_share_options = IFClient::ShareOptions.new
    new_share_options.block_size = "" ##pass empty string to inherit
    #new_share_options.mount_point = ##OPTIONAL
    new_share_options.quota = -1
    # new_share_options.reservation = ##-1 OR OPTIONAL

        ##Set share permissions params
    new_share_permissions = IFClient::SharePermissions.new
    #new_share_permissions.group_list = ##OPTIONAL
    new_share_permissions.share_permission_enum = IFClient::PermissionTypeEnum::N0
    new_share_permissions.share_permission_mode = IFClient::PermissionTypeEnum::N0
    #new_share_permissions.user_list = ##OPTIONAL
    
        ##Set share params
    create_share_param = IFClient::CreateShareParam.new
    create_share_param.arg0_pool_name = "pool-a"
    create_share_param.arg1_project_name = project_name
    create_share_param.arg2_share_name = share_name
    create_share_param.arg3_share_options = new_share_options
    create_share_param.arg4_share_permissions = [new_share_permissions] ##Requires []
    begin
        #Creates a share with the specified share options and share permissions.
        result = api_instance.create_share_post(create_share_param)
        puts result
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->create_share: #{error.inspect}"
    end
end

def modify_share_properties(project_name,share_name)
    api_instance = IFClient::DataApi.new
    share_properties = IFClient::ShareV21.new
    # share_properties.project_name = 
    # share_properties.pool_name = 
    # share_properties.local_dataset = 
    # share_properties.purpose = 
    share_properties.compression = "lzjb"
    share_properties.compressed_log = "lz4"
    share_properties.dedup = "off"
    # share_properties.copies = 
    share_properties.primary_cache = "none"
    share_properties.secondary_cache = "none"
    share_properties.readonly = "on"
    share_properties.logbias = "throughput"
    # share_properties.sync = 
    # share_properties.zfs_data_set_name = 
    # share_properties.name = 
    # share_properties.guid = 
    # share_properties.override_compression = 
    share_properties.reservation_in_byte = 268435456000
    # share_properties.reservation = 
    # share_properties.reservation_metric = 
    # share_properties.reservation_enabled = 
    # share_properties.override_dedup = 
    # share_properties.override_copies = 
    # share_properties.override_primary_cache = 
    # share_properties.override_secondary_cache = 
    # share_properties.override_readonly = 
    # share_properties.override_logbias = 
    # share_properties.override_sync = 
    # share_properties.override_project_snapshot_settings = 
    # share_properties.override_compressed_log = 
    # share_properties.container_name = 
    # share_properties.override_mount_point = 
    share_properties.quota_in_byte = 536870912000
    # share_properties.quota = 
    # share_properties.quota_metric = 
    # share_properties.quota_enabled = 
    # share_properties.mount_point = 
    # share_properties.available_size = 
    # share_properties.total_size = 
    # share_properties.override_sharenfs = 
    # share_properties.override_sharesmb = 
    # share_properties.krb_status = 
    # share_properties.cifs_display_name = 
    # share_properties.guest_status = 
    share_properties.acl_inherit = "off"
    # share_properties.override_acl_inherit = 
    share_properties.record_size = "4KB"
    # share_properties.override_record_size = 
    # share_properties.atime = 
    # share_properties.nbmand = 
    # share_properties.acl_list = 

    modify_share_properties_param = IFClient::ModifySharePropertiesParam.new
    modify_share_properties_param.arg0_dataset_path = "pool-a/Local/#{project_name}/#{share_name}"
    modify_share_properties_param.arg1_share = share_properties
    begin
        #Modify value of a subset of project properties
        result = api_instance.modify_share_properties_post(modify_share_properties_param)
        puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->modify_share_properties: #{error.inspect}"
    end
end

# get_share("ui-project1","api-share4")
# puts
# get_share("ui-project1","ui-share1")

# create_share("ui-project1","api-share4")

# modify_share_properties("ui-project1","api-share4")

def inherit_property_from_project(project_name,volume_name)
    api_instance = IFClient::DataApi.new
    inherit_property_from_project_param = IFClient::InheritPropertyFromProjectParam.new
    inherit_property_from_project_param.arg0_dataset_path = "pool-a/Local/#{project_name}/#{volume_name}"
    inherit_property_from_project_param.arg1_prop_name = "CompressedLog"
    
    begin
      #Inherit properties from parent project settings (revert/rollback to parent setting)
      result = api_instance.inherit_property_from_project_post(inherit_property_from_project_param)
      puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->inherit_property_from_project: #{error.inspect}"
    end
end

# inherit_property_from_project("ui-project1","api-lun1")


def create_project(project_name)
    api_instance = IFClient::DataApi.new

    project = IFClient::ProjectV21.new
    project.project_name = project_name
    project.pool_name = "pool-a"
    # project.compression = 
    # project.compressed_log = 
    # project.intended_protocol_list = 
    # project.quota_in_byte = 
    # project.dedup = 
    # project.copies = 
    # project.primary_cache = 
    # project.secondary_cache = 
    # project.readonly = 
    # project.logbias = 
    # project.acl_inherit = 
    # project.default_volume_size_in_byte = 
    # project.default_volume_block_size = 
    # project.default_thin_provisioning = 
    # project.record_size = 

    create_project_param = IFClient::CreateProjectParam.new
    create_project_param.arg0_project = project
    begin
      #Creates a project
      result = api_instance.create_project_post(create_project_param)
      puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->create_project: #{error.inspect}"
    end
end

def get_project(project_name)
    api_instance = IFClient::DataApi.new
    
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = "pool-a"
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = true
    
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->get_project: #{error.inspect}"
    end
end

def modify_project_properties(project_name)
    api_instance = IFClient::DataApi.new

    project = IFClient::ProjectV21.new
    project.compression = "gzip-2"
    project.compressed_log = "lz4"
    project.intended_protocol_list = ["NFS","iSCSI"]
    project.quota_in_byte = 536870912000
    project.dedup = "off"
    project.copies = "2"
    project.primary_cache = "none"
    project.secondary_cache = "none"
    project.readonly = "on"
    project.logbias = "throughput"
    project.acl_inherit = "off"
    project.default_volume_size_in_byte = 8589934592
    project.default_volume_block_size = "4KB"
    project.default_thin_provisioning = true
    project.record_size = "8KB"


    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "pool-a/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project

    begin
        #Modify value of a subset of Project properties
        result = api_instance.modify_project_properties_post(modify_project_properties_param)
        puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->modify_project_properties: #{error.inspect}"
    end
end

# create_project("api-project1")
# get_project("api-project1")
# modify_project_properties("api-project1")


def get_volume(project_name,lun_name)
    api_instance = IFClient::DataApi.new
    get_volume_param = IFClient::GetVolumeParam.new
    get_volume_param.arg0_dataset_path = "pool-a/Local/#{project_name}/#{lun_name}"
    begin
        #Get the Volume details.
        result = api_instance.get_volume_post(get_volume_param)
        puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->get_volume: #{error.inspect}"
    end
end

def create_volume(project_name,lun_name)
    api_instance = IFClient::DataApi.new

    volume = IFClient::VolumeV10.new
    # volume.block_size = "32KB"
    # volume.dataset_path = 
    # volume.local = 
    # volume.lu_id = 
    volume.name = lun_name
    volume.pool_name = "pool-a"
    volume.project_name = project_name
    volume.protocol = "iSCSI"
    volume.thin_provision = true
    volume.vol_size = 215822106624
    
    create_volume_param = IFClient::CreateVolumeParam.new # CreateVolumeParam | 
    create_volume_param.arg0_volume = volume
    create_volume_param.arg1_inherit_san_view_settings_from_project = true
    begin
        #Creates a volume with the specified settings.
        result = api_instance.create_volume_post(create_volume_param)
        puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->create_volume: #{error.inspect}"
    end
end

def modify_volume_properties(project_name,lun_name)
    api_instance = IFClient::DataApi.new

    volume = IFClient::VolumeV21.new
    # volume.compression = "lzjb"
    # volume.compressed_log = "lz4"
    # volume.dedup = "off"
    # volume.copies = 
    # volume.primary_cache = "none"
    # volume.secondary_cache = "none"
    # volume.readonly = "on"
    # volume.logbias = "throughput"
    # volume.sync = ????
    volume.reservation_in_byte = 162135015424
    # volume.block_size = "32KB"  ###No work
    # volume.write_back_cache = "disable"
    
    modify_volume_properties_param = IFClient::ModifyVolumePropertiesParam.new # ModifyVolumePropertiesParam | 
    modify_volume_properties_param.arg0_dataset_path = "pool-a/Local/#{project_name}/#{lun_name}"
    modify_volume_properties_param.arg1_volume = volume
    
    begin
        #Modify value of a subset of Volume properties
        result = api_instance.modify_volume_properties_post(modify_volume_properties_param)
        puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling DataApi->modify_volume_properties: #{error.inspect}"
    end
end


# get_volume("ui-project1","api-lun1")
# create_volume("ui-project1","api-lun1")
# modify_volume_properties("ui-project1","api-lun1")
