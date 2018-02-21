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

# project_create("api-project1","pool-a")
project_get("pool-a","api-project1")
project_get("pool-a","ui-project1")
# share_create("pool-a","api-project1","share1","")
share_get("pool-a","api-project1","share1")
share_get("pool-a","ui-project1","share1")
# lun_create("lun1","pool-a","api-project1","iSCSI",119185342464)
lun_get("pool-a","api-project1","lun1")
lun_get("pool-a","ui-project1","lun1")

# puts "get_initiator_group"
# api_instance = IFClient::SANApi.new
# get_initiator_group_param = IFClient::GetInitiatorGroupParam.new # GetInitiatorGroupParam | 
# get_initiator_group_param.arg0_initiator_name = "iqn.2017-07.com.test:puppet-host1"
# begin
#   #Gets the name of the initiator group to which the initiator belongs.
#   result = api_instance.get_initiator_group_post(get_initiator_group_param)
#   puts result.inspect
# rescue IFClient::ApiError => e
#   puts "Exception when calling SANApi->get_initiator_group_post: #{e}"
# end

# puts "list_iscsi_initiators_post"
# api_instance = IFClient::SANApi.new
# list_iscsi_initiators_param = IFClient::ListISCSIInitiatorsParam.new # ListISCSIInitiatorsParam | 
# list_iscsi_initiators_param.arg0_initiator_name_pattern = ".*"
# begin
#   #List iSCSI Initiators with name matching specified pattern
#   result = api_instance.list_iscsi_initiators_post(list_iscsi_initiators_param)
#   puts result
# rescue IFClient::ApiError => e
#   puts "Exception when calling SANApi->list_iscsi_initiators_post: #{e}"
# end


# api_instance = IFClient::SANApi.new
# begin
#   #List all initiator groups available on IntelliFlash Array
#   result = api_instance.list_initiator_groups_get
#   puts result
# rescue IFClient::ApiError => e
#   puts "Exception when calling SANApi->list_initiator_groups_get: #{e}"
# end