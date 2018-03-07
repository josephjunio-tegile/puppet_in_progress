require "tegile-api"

host = "172.16.8.200"
username = "admin"
password = "t"
# pool_name = "pool-a"
# project_name = "project1"

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
  #config.debugging = true
end


def project_create(project_name,pool_name)
  #,compression_type,compressed_log,intended_protocol_list,quota,dedup,primary_cache,secondary_cache,acl_inherit,default_lun_size,default_lun_block_size,default_thin_provisioning,default_share_block_size)
  api_instance = IFClient::DataApi.new
  new_project = IFClient::Project_V2_1.new
  new_project.project_name = project_name
  new_project.pool_name = pool_name
  # new_project.compression = compression_type
  # new_project.compressed_log = compressed_log
  # new_project.intended_protocol_list = intended_protocol_list
  # new_project.quota_in_byte = quota
  # new_project.dedup = dedup
  # new_project.primary_cache = primary_cache
  # new_project.secondary_cache = secondary_cache
  # new_project.acl_inherit = acl_inherit
  # new_project.default_volume_size_in_byte = default_lun_size
  # new_project.default_volume_block_size = default_lun_block_size
  # new_project.default_thin_provisioning = default_thin_provisioning
  # new_project.record_size = default_share_block_size
  create_project_param = IFClient::CreateProjectParam.new
  create_project_param.arg0_project = new_project
  begin
    ##Creates a project
    result = api_instance.create_project_post(create_project_param)
    puts result.inspect
    # if result.value == 0
    #   puts "#{project_name} created"
    # else
    #   fail "Error with TegileApi(project_create)"
    # end
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    puts "Exception when calling TegileApi(project_create): #{error["message"]}"
  end 
end

def project_get(pool_name,project_name)
  api_instance = IFClient::DataApi.new
  get_project_param = IFClient::GetProjectParam.new
  get_project_param.arg0_pool_name = pool_name
  get_project_param.arg1_project_name = project_name
  get_project_param.arg2_local = true
  begin
    ##Get the Project details.
    result = api_instance.get_project_post(get_project_param)
    puts result.inspect
    # return result
  rescue IFClient::ApiError => e
    # error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(project_get): #{e}"
  end
end

def share_create(pool_name,project_name,share_name,block_size)
  #,mount_point)
  api_instance = IFClient::DataApi.new
  ##Set share option params
  new_share_options = IFClient::ShareOptions.new
  #new_share_options.block_size = IFClient::BlockSizeEnum::N32_KB
  new_share_options.block_size = block_size
  # new_share_options.mount_point = mount_point
  new_share_options.quota = -1
  # new_share_options.reservation = -1
  ##Set share permissions params
  new_share_permissions = IFClient::SharePermissions.new
  #new_share_permissions.group_list = ##OPTIONAL
  new_share_permissions.share_permission_enum = IFClient::Permission_type_enum::N0
  new_share_permissions.share_permission_mode = IFClient::Permission_type_enum::N0
  #new_share_permissions.user_list = ##OPTIONAL
  ##Set share params
  create_share_param = IFClient::CreateShareParam.new
  create_share_param.arg0_pool_name = pool_name
  create_share_param.arg1_project_name = project_name
  create_share_param.arg2_share_name = share_name
  create_share_param.arg3_share_options = new_share_options
  create_share_param.arg4_share_permissions = [new_share_permissions] ##Requires []
  begin
    #Creates a share with the specified share options and share permissions
    result = api_instance.create_share_post(create_share_param)
    puts result.inspect
    # if result.value == 0
    #   puts "#{share_name} created"
    # else
    #   puts "Error with TegileApi(share_create)"
    # end
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(share_create): #{error["message"]}"
  end
end

def share_get(pool_name,project_name,share_name)
  api_instance = IFClient::DataApi.new
  get_share_param = IFClient::GetShareParam.new
  get_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
  begin
    ##Get the Share details.
    result = api_instance.get_share_post(get_share_param)
    puts result.inspect
    # return result
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(share_get): #{error["message"]}"
  end 
end

def lun_create(lun_name,pool_name,project_name,lun_protocol,lun_size)
  #,block_size)
  #,thin_provision)
  api_instance = IFClient::DataApi.new
  #Set volume params
  new_vol = IFClient::Volume_V1_0.new
  new_vol.name = lun_name
  new_vol.pool_name = pool_name
  new_vol.project_name = project_name
  new_vol.protocol = lun_protocol
  new_vol.vol_size = lun_size
  #new_vol.block_size = IFClient::BlockSizeEnum::N32_KB  ##ReferencesBlockSizeEnum
  # new_vol.block_size = block_size
  # new_vol.thin_provision = thin_provision
  #new_vol.local = true ##OPTIONAL
  create_volume_param = IFClient::CreateVolumeParam.new
  create_volume_param.arg0_volume = new_vol
  create_volume_param.arg1_inherit_san_view_settings_from_project = true
  begin
    #Creates a volume with the specified settings.
    result = api_instance.create_volume_post(create_volume_param)
    puts result.inspect
    # if result.value == 0
    #   puts "#{lun_name} created"
    # else
    #   puts "Error When Creating Volume"
    # end
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(lun_create): #{error["message"]}"
    # fail "Exception when calling TegileApi(lun_create): #{e}"
  end
end

def lun_get(pool_name,project_name,lun_name)
  api_instance = IFClient::DataApi.new
  get_volume_param = IFClient::GetVolumeParam.new
  get_volume_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
  begin
    ##Get the Volume details
    result = api_instance.get_volume_post(get_volume_param)
    puts result.inspect
    # return result
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(lun_get): #{error["message"]}"
  end 
end

def set_nfs_network_ac_ls_on_project(pool_name,project_name)
  api_instance = IFClient::NasApi.new
  net_acl = IFClient::NetworkACL_V2_1.new
  net_acl.host_type = "IP"
  net_acl.host = "1.1.1.1"
  net_acl.access_mode = "rw"
  net_acl.root_access_for_nfs = false
  set_nfs_network_ac_ls_on_project_param = IFClient::SetNFSNetworkACLsOnProjectParam.new
  set_nfs_network_ac_ls_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
  set_nfs_network_ac_ls_on_project_param.arg1_network_ac_ls = [net_acl]
  begin
    #Set the network ACLS on the NFS Project If the dataset contains any network ACLs, they will be removed as well.
    result = api_instance.set_nfs_network_ac_ls_on_project_post(set_nfs_network_ac_ls_on_project_param)
    puts result.inspect
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(set_nfs_network_ac_ls_on_project): #{error["message"]}"
  end
end

def set_nfs_sharing_on_project(pool_name,project_name)
  api_instance = IFClient::NasApi.new
  set_nfs_sharing_on_project_param = IFClient::SetNFSSharingOnProjectParam.new
  set_nfs_sharing_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
  set_nfs_sharing_on_project_param.arg1_turn_on = true
  begin
    #Enable/Disable NFS protocol for a Project
    result = api_instance.set_nfs_sharing_on_project_post(set_nfs_sharing_on_project_param)
    puts result.inspect
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(set_nfs_sharing_on_project): #{error["message"]}"
  end
end

# project_create("api-project1","pool-a")
# project_get("pool-a","vs-proj")
# project_get("pool-a","gen-proj")
# share_create("pool-a","api-project1","share1","")
# share_get("pool-a","gen-proj","gen-share")
# share_get("pool-a","puppet-proj-notp","puppet-share")
# lun_create("lun1","pool-a","api-project1","iSCSI",119185342464)
# lun_get("pool-a","gen-proj","gen-lun")
# lun_get("pool-a","puppet-proj-notp","lun1-2")
set_nfs_network_ac_ls_on_project("pool-a","api-project1")
# set_nfs_sharing_on_project("pool-a","api-project1")

