require 'tegile-api'

class TegileApi

  def initialize(host,username,password)
    IFClient.configure do |config|
      config.username = username
      config.password = password
      config.host = host
      config.verify_ssl = false
    end
    list_system_properties
    puts "IFClient Configured with #{host} and #{username}"
  end


  def share_create(pool_name,project_name,share_name,block_size)
    api_instance = IFClient::DataApi.new
    ##Set share option params
    new_share_options = IFClient::ShareOptions.new
    #new_share_options.block_size = IFClient::BlockSizeEnum::N32_KB
    new_share_options.block_size = block_size
    #new_share_options.mount_point = ##OPTIONAL
    new_share_options.quota = -1
    new_share_options.reservation = -1
    ##Set share permissions params
    new_share_permissions = IFClient::SharePermissions.new
    #new_share_permissions.group_list = ##OPTIONAL
    new_share_permissions.share_permission_enum = IFClient::PermissionTypeEnum::N0
    new_share_permissions.share_permission_mode = IFClient::PermissionTypeEnum::N0
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
      if result.value == 0
        puts "#{share_name} created"
      else
        puts "Error with TegileApi(share_create)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_create): #{error["message"]}"
    end
  end

  def share_exists(share_name,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    #Set share params
    list_shares_param = IFClient::ListSharesParam.new
    list_shares_param.arg0_pool_name = pool_name
    list_shares_param.arg1_project_name = project_name
    list_shares_param.arg2_local = TRUE
    begin
      #Lists all the local and replicated shares in a project.
      result = api_instance.list_shares_post(list_shares_param)
      exists = nil
      result.each do |x|
        if x.name == share_name
          exists = true
          puts "found #{x.name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def share_delete(pool_name,project_name,share_name)
    api_instance = IFClient::DataApi.new
    delete_share_param = IFClient::DeleteShareParam.new
    delete_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    delete_share_param.arg1_recursive = false
    delete_share_param.arg2_error_if_not_exist = true
    begin
        ##Deletes the specified share, and optionally, any dependents of the share.
      api_instance.delete_share_post(delete_share_param)
      puts "#{share_name} deleted"
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_create): #{error["message"]}"
    end
  end

  def lun_exists(lun_name,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    #Set volumes params
    list_volumes_param = IFClient::ListVolumesParam.new
    list_volumes_param.arg0_pool_name = pool_name
    list_volumes_param.arg1_project_name = project_name
    list_volumes_param.arg2_local = TRUE
    begin
      #Lists all the local or replicated volumes within a Project.
      result = api_instance.list_volumes_post(list_volumes_param)
      #puts result
      exists = nil
      result.each do |x|
        if x.name == lun_name
          exists = true
          puts "found #{x.name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      begin
        data = JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0]
      rescue JSON::ParserError => e
        if %w(String Date DateTime).include?(return_type)
          data = body
        else
          raise e
        end
      end
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(lun_exists): #{error["message"]}"
    end
  end

  def lun_create(lun_name,pool_name,project_name,lun_protocol,lun_size,block_size)
    api_instance = IFClient::DataApi.new
    #Set volume params
    new_vol = IFClient::VolumeV10.new
    new_vol.name = lun_name
    new_vol.pool_name = pool_name
    new_vol.project_name = project_name
    new_vol.protocol = lun_protocol
    new_vol.vol_size = lun_size
    #new_vol.block_size = IFClient::BlockSizeEnum::N32_KB  ##ReferencesBlockSizeEnum
    new_vol.block_size = block_size
    new_vol.thin_provision = true
    #new_vol.local = true ##OPTIONAL
    create_volume_param = IFClient::CreateVolumeParam.new
    create_volume_param.arg0_volume = new_vol
    create_volume_param.arg1_inherit_san_view_settings_from_project = true
    begin
      #Creates a volume with the specified settings.
      result = api_instance.create_volume_post(create_volume_param)
      if result.value == 0
        puts "#{lun_name} created"
      else
        puts "Error When Creating Volume"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(lun_create): #{error["message"]}"
    end
  end

  def lun_delete(pool_name,project_name,lun_name)
    api_instance = IFClient::DataApi.new
    delete_dataset_param = IFClient::DeleteDatasetParam.new
    delete_dataset_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    delete_dataset_param.arg1_recursive = false
    delete_dataset_param.arg2_error_if_not_exist = true
    begin
      api_instance.delete_dataset_post(delete_dataset_param)
      puts "#{lun_name} deleted"
    rescue IFClient::ApiError => e
      puts "Exception when calling DataApi->delete_dataset_post: #{e}"
      fail
    end
  end

  def initiator_group_exists(initiator_group_name)
    api_instance = IFClient::SANApi.new
    begin
      ##Lists all the iSCSI initiator groups available on a Tegile array.
      result = api_instance.list_initiator_groups_get
      #puts result
      exists = nil
      result.each do |x|
        if x.initiator_group_name == initiator_group_name
          exists = true
          puts "found #{x.initiator_group_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->list_iscsi_initiator_groups_get: #{e}"
      fail
    end
  end

  def initiator_group_create(initiator_group_name)
    api_instance = IFClient::SANApi.new
    create_initiator_group_param = IFClient::CreateInitiatorGroupParam.new
    create_initiator_group_param.arg0_initiator_group_name = initiator_group_name
    begin
        ##Creates an initiator group on a Tegile array.
      result = api_instance.create_initiator_group_post(create_initiator_group_param)
      if result.value == 0
        puts "#{initiator_group_name} created"
      else
        puts "Error with TegileApi(initiator_group_create)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(initiator_group_create): #{error["message"]}"
    end 
  end

  def initiator_group_delete(initiator_group_name)
    api_instance = IFClient::SANApi.new
    delete_initiator_group_param = IFClient::DeleteInitiatorGroupParam.new
    delete_initiator_group_param.arg0_initiator_group_name = initiator_group_name
    begin
        ##Delete an Initiator Group
      result = api_instance.delete_initiator_group_post(delete_initiator_group_param)
      if result.value == 0
        puts "#{initiator_group_name} deleted"
      else
        puts "Error"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(initiator_group_delete): #{error["message"]}"
    end 
  end

  def initiator_exists(initiator_name)
    api_instance = IFClient::SANApi.new
    list_iscsi_initiators_param = IFClient::ListISCSIInitiatorsParam.new
    list_iscsi_initiators_param.arg0_initiator_name_pattern = ".*"
    begin
      ##List iSCSI Initiators with name matching specified pattern
      result = api_instance.list_iscsi_initiators_post(list_iscsi_initiators_param)
      #puts result
      exists = nil
      result.each do |x|
        if x.initiator_name == initiator_name
          exists = true
          puts "found #{x.initiator_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->list_iscsi_initiators_post: #{e}"
      fail
    end
  end

  def initiator_create(initiator_name,initiator_chap_user_name,initiator_chap_secret)
    api_instance = IFClient::SANApi.new
    new_initiator = IFClient::IscsiInitiatorV10.new
    new_initiator.chap_secret = initiator_chap_secret
    new_initiator.chap_user_name = initiator_chap_user_name
    new_initiator.initiator_name = initiator_name
    create_iscsi_initiator_param = IFClient::CreateIscsiInitiatorParam.new
    create_iscsi_initiator_param.arg0_iscsi_initiator = new_initiator
    begin
      ##Creates an iSCSI initiator object on the Tegile array. If the initiator name already exists, then the method fails.
      result = api_instance.create_iscsi_initiator_post(create_iscsi_initiator_param)
      #puts result
      if result.value == 0
        puts "#{initiator_name} created"
      else
        puts "Error with TegileApi(initiator_create)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(initiator_create): #{error["message"]}"
    end
  end

  def initiator_delete(initiator_name)
    api_instance = IFClient::SANApi.new
    delete_iscsi_initiator_param = IFClient::DeleteISCSIInitiatorParam.new
    delete_iscsi_initiator_param.arg0_initiator_name = initiator_name
    begin
      ##Delete an iSCSI Initiator
      result = api_instance.delete_iscsi_initiator_post(delete_iscsi_initiator_param)
      #puts result
      if result.value == 0
        puts "#{initiator_name} deleted"
      else
        fail "Error with TegileApi(initiator_delete)"
      end
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        fail "Exception when calling TegileApi(initiator_delete): #{error["message"]}"
    end
  end

  def add_initiator_to_initiator_group(initiator_name,initiator_group_name)
    api_instance = IFClient::SANApi.new
    add_initiator_to_initiator_group_param = IFClient::AddInitiatorToInitiatorGroupParam.new
    add_initiator_to_initiator_group_param.arg0_initiator_name = initiator_name
    add_initiator_to_initiator_group_param.arg1_initiator_group_name = initiator_group_name
    begin
      ##Associates an initiator with an initiator group.
      result = api_instance.add_initiator_to_initiator_group_post(add_initiator_to_initiator_group_param)
      #puts result
      if result.value == 0
        puts "#{initiator_name} added to #{initiator_group_name}"
      else
        puts "Error with TegileApi(add_initiator_to_initiator_group)"
      end
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        fail "Exception when calling TegileApi(add_initiator_to_initiator_group): #{error["message"]}"
    end
  end

  def move_target_to_target_group(target_group_name)
    api_instance = IFClient::SANApi.new
    move_target_to_target_group_param = IFClient::MoveTargetToTargetGroupParam.new
    move_target_to_target_group_param.arg0_target_name = "iqn.2012-02.com.tegile:holder-target"
    move_target_to_target_group_param.arg1_new_target_group_name = target_group_name
    begin
      ##Move a target specified with targetName to a new target group specified with newTargetGroupName
      result = api_instance.move_target_to_target_group_post(move_target_to_target_group_param)
      #puts result
      if result == 0
        puts "holder target added to #{target_group_name}"
      else
        puts "Error"
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->move_target_to_target_group_post: #{e}"
      fail
    end
  end

  def iscsi_target_group_exists(iscsi_target_group_name) ##Not returning unused groups
    api_instance = IFClient::SANApi.new
    begin
      ##Lists all the iSCSI target groups available on a Tegile array.
      result = api_instance.list_iscsi_target_groups_get
      #puts result
      exists = nil
      result.each do |x|
        if x == iscsi_target_group_name
          exists = true
          puts "found #{iscsi_target_group_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->list_iscsi_target_groups_get: #{e}"
      fail
    end
  end

  def iscsi_target_group_create(iscsi_target_group_name,pool_name)
    api_instance = IFClient::SANApi.new
    create_target_group_param = IFClient::CreateTargetGroupParam.new
    create_target_group_param.arg0_target_group_name = iscsi_target_group_name
    create_target_group_param.arg1_pool_name = pool_name
    begin
      ##Create a target group with the specified target group name in the resource group containing the named pool with the intended protocol
      result = api_instance.create_target_group_post(create_target_group_param)
      #puts result
      if result.value == 0
        puts "#{iscsi_target_group_name} created"
      else
        puts "Error with TegileApi(iscsi_target_group_create)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(iscsi_target_group_create): #{error["message"]}"
    end 
  end

  def iscsi_target_group_create_fix(iscsi_target_group_name,pool_name)
    api_instance = IFClient::SANApi.new
    create_target_group_param = IFClient::CreateTargetGroupParam.new
    create_target_group_param.arg0_target_group_name = iscsi_target_group_name
    create_target_group_param.arg1_pool_name = pool_name
    begin
      ##Create a target group with the specified target group name in the resource group containing the named pool with the intended protocol
      result = api_instance.create_target_group_post(create_target_group_param)
      #puts result
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      # puts "Exception when calling TegileApi(lun_lun_mappings_set_delete): #{error["message"]}"
      return error
    end 
  end

  def iscsi_target_group_delete(iscsi_target_group_name)
    api_instance = IFClient::SANApi.new
    delete_target_group_param = IFClient::DeleteTargetGroupParam.new
    delete_target_group_param.arg0_target_group_name = iscsi_target_group_name
    begin
      ##Delete a Target Group
      result = api_instance.delete_target_group_post(delete_target_group_param)
      if result.value == 0
        puts "#{iscsi_target_group_name} deleted"
      else
        puts "Error with TegileApi(iscsi_target_group_delete)"
      end
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        fail "Exception when calling TegileApi(iscsi_target_group_delete): #{error["message"]}"
    endail
    end
  end

  def iscsi_target_group_delete_fix(iscsi_target_group_name)
    api_instance = IFClient::SANApi.new
    delete_target_group_param = IFClient::DeleteTargetGroupParam.new
    delete_target_group_param.arg0_target_group_name = iscsi_target_group_name
    begin
      ##Delete a Target Group
      result = api_instance.delete_target_group_post(delete_target_group_param)
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def iscsi_target_exists(iscsi_target_name)
    api_instance = IFClient::SANApi.new
    list_iscsi_targets_param = IFClient::ListISCSITargetsParam.new
    list_iscsi_targets_param.arg0_target_name_pattern = ".*"
    begin
      ##List iSCSI Targets with name matching specified pattern
      result = api_instance.list_iscsi_targets_post(list_iscsi_targets_param)
      #puts result
      exists = nil
      result.each do |x|
        #puts x.target_name + iscsi_target_name
        if x.target_name == "iqn.2012-02.com.tegile:#{iscsi_target_name}"
          exists = true
          puts "found iscsi target: #{x.target_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->list_iscsi_targets_post: #{e}"
      fail
    end
  end

  def iscsi_target_create(iscsi_target_name,iscsi_target_alias,iscsi_target_group,iscsi_target_auth,iscsi_target_chap_name,iscsi_target_chap_secret,iscsi_target_ip,iscsi_target_port)
    api_instance = IFClient::SANApi.new
    new_iscsi_target = IFClient::ISCSITargetCreateV21.new
    new_iscsi_target.target_suffix_name = iscsi_target_name
    new_iscsi_target.target_alias = iscsi_target_alias
    new_iscsi_target.target_group_name = iscsi_target_group
    new_iscsi_target.target_authentication_mode = iscsi_target_auth
    new_iscsi_target.target_chap_name = iscsi_target_chap_name
    new_iscsi_target.target_chap_secret = iscsi_target_chap_secret
    new_iscsi_target.target_network_binding = ["#{iscsi_target_ip}:#{iscsi_target_port}"]
    create_iscsi_target_param = IFClient::CreateISCSITargetParam.new
    create_iscsi_target_param.arg0_iscsi_target = new_iscsi_target
    begin
      ##Create an iSCSI Target
      result = api_instance.create_iscsi_target_post(create_iscsi_target_param)
      #puts result
      if result.value == 0
        puts "#{iscsi_target_name} created"
      else
        puts "Error with TegileApi(iscsi_target_create)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(iscsi_target_create): #{error["message"]}"
    end
  end

  def iscsi_target_delete(iscsi_target_name)
    api_instance = IFClient::SANApi.new
    delete_iscsi_target_param = IFClient::DeleteISCSITargetParam.new
    delete_iscsi_target_param.arg0_target_name = "iqn.2012-02.com.tegile:#{iscsi_target_name}"
    begin
      ##Delete an iSCSI Target
      result = api_instance.delete_iscsi_target_post(delete_iscsi_target_param)
      #puts result
      if result.value == 0
        puts "#{iscsi_target_name} deleted"
      else
        puts "Error with TegileApi(iscsi_target_delete)"
      end
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        fail "Exception when calling TegileApi(iscsi_target_delete): #{error["message"]}"
    end
  end

  def project_mapping_exists(pool_name,project_name,initiator_group_name,target_group_name)
    api_instance = IFClient::SANApi.new
    get_project_default_iscsi_it_view_param = IFClient::GetProjectDefaultIscsiITViewParam.new
    get_project_default_iscsi_it_view_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      ##List all of the default iSCSI views of the project
      result = api_instance.get_project_default_iscsi_it_view_post(get_project_default_iscsi_it_view_param)
      #puts result
      exists = false
      result.each do |x|
        #puts "checking mapping: #{project_name}__#{x.host_group_name}+#{x.target_group_name}"
        if x.host_group_name == initiator_group_name && x.target_group_name == target_group_name
          exists = true
          puts "found mapping: #{project_name}__#{x.host_group_name}+#{x.target_group_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->get_project_default_iscsi_it_view_post: #{e}"
      fail
    end
  end

  def project_mapping_create__old(pool_name,project_name,initiator_group_name,target_group_name)
    api_instance = IFClient::SANApi.new
    create_mapping_for_project_param = IFClient::CreateMappingForProjectParam.new
    create_mapping_for_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    create_mapping_for_project_param.arg1_initiator_group_name = initiator_group_name
    create_mapping_for_project_param.arg2_target_group_name = target_group_name
    create_mapping_for_project_param.arg3_read_only = false
    begin
      ##Create a project level default mapping
      result = api_instance.create_mapping_for_project_post(create_mapping_for_project_param)
      #puts result
      if result == 0
        puts "Mapping for #{project_name} created"
      else
        puts "Error"
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->create_mapping_for_project_post: #{e}"
      fail
    end
  end

  def project_mapping_delete__old(pool_name,project_name,initiator_group_name,target_group_name)
    api_instance = IFClient::SANApi.new
    delete_mapping_from_project_param = IFClient::DeleteMappingFromProjectParam.new
    delete_mapping_from_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    delete_mapping_from_project_param.arg1_initiator_group_name = initiator_group_name
    delete_mapping_from_project_param.arg2_target_group_name = target_group_name
    begin
      ##Deletes the view (mapping) between the given project, initiator group, and target group.
      result = api_instance.delete_mapping_from_project_post(delete_mapping_from_project_param)
      #puts result
      if result == 0
        puts "mapping for #{project_name} deleted"
      else
        puts "Error deleting mapping"
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->delete_mapping_from_project_post: #{e}"
      fail
    end
  end

  def lun_mapping_exists(pool_name,project_name,lun_name,initiator_group_name,target_group_name)
    api_instance = IFClient::SANApi.new
    get_volume_it_view_param = IFClient::GetVolumeITViewParam.new
    get_volume_it_view_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    begin
      ##List all of the existing views of the volume
      result = api_instance.get_volume_it_view_post(get_volume_it_view_param)
      #puts result
      exists = nil
      result.each do |x|
        if x.host_group_name == initiator_group_name && x.target_group_name == target_group_name
          exists = true
          puts "found mapping: #{lun_name}__#{x.host_group_name}+#{x.target_group_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->get_volume_it_view_post: #{e}"
      fail
    end
  end

  def project_nfs_network_acl_exists(pool_name,project_name,acl_type,acl_host)
    api_instance = IFClient::NasApi.new
    get_nfs_network_ac_ls_on_project_param = IFClient::GetNFSNetworkACLsOnProjectParam.new
    get_nfs_network_ac_ls_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      ##Returns all the Network ACLs for the NFS Project
      result = api_instance.get_nfs_network_ac_ls_on_project_post(get_nfs_network_ac_ls_on_project_param)
      #puts result
      exists = nil
      result.each do |x|
        if x.host_type == acl_type && x.host == acl_host
          exists = true
          puts "found acl: #{project_name}__#{x.host_type}+#{x.host}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling NasApi->get_nfs_network_ac_ls_on_project_post: #{e}"
      fail
    end
  end

  def project_nfs_network_acl_create(pool_name,project_name,acl_type,acl_host,access_mode)
    api_instance = IFClient::NasApi.new
    add_nfs_network_acl_on_project_param = IFClient::AddNFSNetworkACLOnProjectParam.new
    add_nfs_network_acl_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    add_nfs_network_acl_on_project_param.arg1_type = acl_type
    add_nfs_network_acl_on_project_param.arg2_host = acl_host
    add_nfs_network_acl_on_project_param.arg3_access_mode = access_mode
    add_nfs_network_acl_on_project_param.arg4_is_root = false
    begin
      #Add network ACL to NFS Project
      result = api_instance.add_nfs_network_acl_on_project_post(add_nfs_network_acl_on_project_param)
      #puts result
      if result == 0
        puts "acl for #{project_name} created"
      else
        puts "Error"
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling NasApi->add_nfs_network_acl_on_project_post: #{e}"
      fail
    end
  end

  def project_nfs_network_acl_delete(pool_name,project_name,acl_type,acl_host)
    api_instance = IFClient::NasApi.new
    remove_nfs_network_acl_on_project_param = IFClient::RemoveNFSNetworkACLOnProjectParam.new
    remove_nfs_network_acl_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    remove_nfs_network_acl_on_project_param.arg1_type = acl_type
    remove_nfs_network_acl_on_project_param.arg2_host = acl_host
    begin
      ##Remove network ACL from NFS Project
      result = api_instance.remove_nfs_network_acl_on_project_post(remove_nfs_network_acl_on_project_param)
      #puts result
      if result == 0
        puts "acl for #{project_name} deleted"
      else
        puts "Error deleting mapping"
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling NasApi->remove_nfs_network_acl_on_project_post: #{e}"
      fail
    end
  end

  def project_nfs_network_acl_get(pool_name,project_name,network_acls)
    api_instance = IFClient::NasApi.new
    get_nfs_network_ac_ls_on_project_param = IFClient::GetNFSNetworkACLsOnProjectParam.new
    get_nfs_network_ac_ls_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      ##Returns all the Network ACLs for the NFS Project
      result = api_instance.get_nfs_network_ac_ls_on_project_post(get_nfs_network_ac_ls_on_project_param)
      puts result
      puts network_acls
    rescue IFClient::ApiError => e
      puts "Exception when calling NasApi->get_nfs_network_ac_ls_on_project_post: #{e}"
      fail
    end
  end

  def share_nfs_network_acl_exists(pool_name,project_name,share_name,acl_type,acl_host)
    api_instance = IFClient::NasApi.new
    get_nfs_network_ac_ls_on_share_param = IFClient::GetNFSNetworkACLsOnShareParam.new
    get_nfs_network_ac_ls_on_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      ##Returns all the Network ACLs for the NFS share
      result = api_instance.get_nfs_network_ac_ls_on_share_post(get_nfs_network_ac_ls_on_share_param)
      #puts result
      exists = nil
      result.each do |x|
        if x.host_type == acl_type && x.host == acl_host
          exists = true
          puts "found acl: #{share_name}__#{x.host_type}+#{x.host}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      puts "Exception when calling NasApi->get_nfs_network_ac_ls_on_share_post: #{e}"
      fail
    end
  end

  def share_nfs_network_acl_create(pool_name,project_name,share_name,acl_type,acl_host,access_mode) ##Will override project if used
    api_instance = IFClient::NasApi.new
    add_nfs_network_acl_on_param = IFClient::AddNFSNetworkACLOnParam.new
    add_nfs_network_acl_on_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    add_nfs_network_acl_on_param.arg1_type = acl_type
    add_nfs_network_acl_on_param.arg2_host = acl_host
    add_nfs_network_acl_on_param.arg3_access_mode = access_mode
    add_nfs_network_acl_on_param.arg4_is_root = false
    begin
      ##Add network ACL to NFS share
      result = api_instance.add_nfs_network_acl_on_share_post(add_nfs_network_acl_on_param)
      #puts result
      if result == 0
        puts "acl for #{share_name} created"
      else
        puts "Error"
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling NasApi->add_nfs_network_acl_on_share_post: #{e}"
      fail
    end
  end

  def share_nfs_network_acl_delete(pool_name,project_name,share_name,acl_type,acl_host)
    api_instance = IFClient::NasApi.new
    remove_nfs_network_acl_on_share_param = IFClient::RemoveNFSNetworkACLOnShareParam.new
    remove_nfs_network_acl_on_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    remove_nfs_network_acl_on_share_param.arg1_type = acl_type
    remove_nfs_network_acl_on_share_param.arg2_host = acl_host
    begin
      ##Remove network ACL from NFS share
      result = api_instance.remove_nfs_network_acl_on_share_post(remove_nfs_network_acl_on_share_param)
      #puts result
      if result == 0
        puts "acl for #{share_name} deleted"
      else
        puts "Error deleting mapping"
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling NasApi->remove_nfs_network_acl_on_share_post: #{e}"
      fail
    end
  end

  def list_system_properties
    api_instance = IFClient::SystemApi.new
    list_system_properties_param = IFClient::ListSystemPropertiesParam.new
    list_system_properties_param.arg0_properties = ["ZEBI_GUI_VERSION"]
    begin
      ##Lists values of the requested system properties for a Tegile array.
      result = api_instance.list_system_properties_post(list_system_properties_param)
      puts result
    rescue IFClient::ApiError => e
      puts "Exception when calling SystemApi->list_system_properties_post: #{e}"
      fail
    end
  end

  def project_exists(project_name,pool_name)
    api_instance = IFClient::DataApi.new
    list_projects_param = IFClient::ListProjectsParam.new
    list_projects_param.arg0_pool_name = pool_name
    list_projects_param.arg1_local = true
    begin
      #Lists all the pools on the Tegile array
      result = api_instance.list_projects_post(list_projects_param)
      # puts result.inspect
      # puts result.length
      if result.length == 0
        return nil
      else
        exists = nil
        result.each do |x|
          if x.name == project_name
            puts "found #{x.name}"
            exists = true
          end
        end
        return exists
      end
    rescue IFClient::ApiError => e
      puts "Exception when calling DataApi->get_project_post: #{e}"
      fail
    end
  end

  def project_create(project_name,pool_name,compression_type,compressed_log,intended_protocol_list,quota,dedup,primary_cache,secondary_cache,acl_inherit,default_lun_size,default_lun_block_size,default_thin_provisioning,default_share_block_size)
    api_instance = IFClient::DataApi.new
    new_project = IFClient::ProjectV21.new
    new_project.project_name = project_name
    new_project.pool_name = pool_name
    new_project.compression = compression_type
    new_project.compressed_log = compressed_log
    new_project.intended_protocol_list = intended_protocol_list
    new_project.quota_in_byte = quota
    new_project.dedup = dedup
    new_project.primary_cache = primary_cache
    new_project.secondary_cache = secondary_cache
    new_project.acl_inherit = acl_inherit
    new_project.default_volume_size_in_byte = default_lun_size
    new_project.default_volume_block_size = default_lun_block_size
    new_project.default_thin_provisioning = default_thin_provisioning
    new_project.record_size = default_share_block_size
    create_project_param = IFClient::CreateProjectParam.new
    create_project_param.arg0_project = new_project
    begin
      ##Creates a project
      result = api_instance.create_project_post(create_project_param)
      # puts result.inspect
      if result.value == 0
        puts "#{project_name} created"
      else
        fail "Error with TegileApi(project_create)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(project_create): #{error["message"]}"
    end 
  end

  def project_delete(project_name,pool_name)
    api_instance = IFClient::DataApi.new
    delete_project_param = IFClient::DeleteProjectParam.new
    delete_project_param.arg0_project_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      ##Deletes the specified project.
      result = api_instance.delete_project_post(delete_project_param)
      #puts result
      if result.value == 0
        sleep(5)
        puts "#{project_name} deleted"
      else
        fail "Error with TegileApi(project_delete)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(project_delete): #{error["message"]}"
    end 
  end

  def set_nfs_sharing_on(project_name,pool_name)
    api_instance = IFClient::NasApi.new
    set_nfs_sharing_on_project_param = IFClient::SetNFSSharingOnProjectParam.new
    set_nfs_sharing_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    set_nfs_sharing_on_project_param.arg1_turn_on = true
    begin
      ##Enable/Disable NFS protocol for a Project
      result = api_instance.set_nfs_sharing_on_project_post(set_nfs_sharing_on_project_param)
      #puts result
      if result.value == 0
        puts "nfs enabled"
      else
        fail "Error with TegileApi(set_nfs_sharing_on)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(set_nfs_sharing_on): #{error["message"]}"
    end 
  end

  def project_set_smb_sharing_on(project_name,pool_name)
    api_instance = IFClient::NasApi.new
    set_smb_sharing_on_project_param = IFClient::SetSMBSharingOnProjectParam.new
    set_smb_sharing_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    set_smb_sharing_on_project_param.arg1_turn_on = true
    begin
      ##Enable/Disable SMB protocol for a Project, If the dataset contains any network ACLs, they are removed as well.
      result = api_instance.set_smb_sharing_on_project_post(set_smb_sharing_on_project_param)
      # puts result.inspect
      if result.value == 0
        puts "smb enabled"
      else
        puts "Error with TegileApi(project_set_smb_sharing_on)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(project_set_smb_sharing_on): #{error["message"]}"
    end 
  end

  def get_lun_size(lun_name,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_volume_param = IFClient::GetVolumeParam.new
    get_volume_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    begin
      ##Get the Volume details
      result = api_instance.get_volume_post(get_volume_param)
      #puts result.vol_size
      return result.vol_size
    rescue IFClient::ApiError => e
      puts "Exception when calling DataApi->get_volume_post: #{e}"
      fail
    end
  end

  def share_acl_inherit_get(pool_name,project_name,share_name)
    api_instance = IFClient::DataApi.new
    get_share_param = IFClient::GetShareParam.new
    get_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      ##Get the Share details
      result = api_instance.get_share_post(get_share_param)
      #puts result.override_sharenfs
      return result.override_sharenfs
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(share_acl_inherit_get): #{error["message"]}"
      fail
    end
  end

  def share_acl_inherit_set(pool_name,project_name,share_name)
    api_instance = IFClient::NasApi.new
    inherit_network_ac_lsettings_from_project_param = IFClient::InheritNetworkACLsettingsFromProjectParam.new
    inherit_network_ac_lsettings_from_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      ##Set the share property to inherit NFS or SMB ACL settings from project.
      result = api_instance.inherit_network_ac_lsettings_from_project_post(inherit_network_ac_lsettings_from_project_param)
      # puts result.inspect
      if result.value == 0
        puts "Inherit network acls from project enabled for #{share_name}"
      else
        puts "Error with TegileApi(share_nfs_network_acls_set_delete)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(share_acl_inherit_set): #{error["message"]}"
      fail
    end
  end

  def lun_override_project_mappings_get(pool_name,project_name,lun_name)
    api_instance = IFClient::DataApi.new
    get_volume_param = IFClient::GetVolumeParam.new
    get_volume_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    begin
      ##Get the Volume details.
      result = api_instance.get_volume_post(get_volume_param)
      # puts result.override_views
      return result.override_views
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(lun_override_project_mappings_get): #{error["message"]}"
      fail
    end
  end

  def lun_override_project_mappings_set(pool_name,project_name,lun_name)
    api_instance = IFClient::DataApi.new
    inherit_property_from_project_param = IFClient::InheritPropertyFromProjectParam.new
    inherit_property_from_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    inherit_property_from_project_param.arg1_prop_name = "Views"
    begin
      ##Inherit properties from parent project settings (revert/rollback to parent setting)
      result = api_instance.inherit_property_from_project_post(inherit_property_from_project_param)
      # puts result.inspect
      if result.value == 0
        puts "lun mappings set to inherit for #{lun_name}"
      else
        puts "Error with TegileApi(lun_override_project_mappings_set)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(lun_override_project_mappings_set): #{error["message"]}"
      fail
    end
  end

  def project_default_share_block_size_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      #puts result.record_size.value
      return result.record_size.value
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end
  
  def project_default_share_block_size_set(block_size,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.record_size = block_size
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      puts result
      if result == 0
        puts "project_default_share_block_size set to #{block_size}"
      else
        puts "Error with project_default_share_block_size_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_default_thin_provisioning_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      #puts result.default_thin_provisioning
      return result.default_thin_provisioning
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end
  
  def project_default_thin_provisioning_set(thin_provisioning,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.default_thin_provisioning = thin_provisioning
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      puts result
      if result == 0
        puts "project_default_thin_provisioning set to #{thin_provisioning}"
      else
        puts "Error with project_default_thin_provisioning_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_default_lun_block_size_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      #puts result.default_volume_block_size.value
      return result.default_volume_block_size.value
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end
  
  def project_default_lun_block_size_set(block_size,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.default_volume_block_size = block_size
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      #puts result
      if result == 0
        puts "project_default_lun_block_size set to #{block_size}"
      else
        puts "Error with project_default_lun_block_size_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_dedup_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      #puts result.dedup
      return result.dedup
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end
  
  def project_dedup_set(dedup,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.dedup = dedup
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      #puts result
      if result == 0
        puts "project_dedup set to #{dedup}"
      else
        puts "Error with project_dedup_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_quota_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      #puts result.quota_in_byte
      return result.quota_in_byte
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end
  
  def project_quota_set(quota,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.quota_in_byte = quota
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      #puts result
      if result.value == 0
        puts "project_quota set to #{quota/1024/1024/1024}GB"
      else
        puts "Error with project_quota_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_compressed_log_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      #puts result.compressed_log
      return result.compressed_log
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end
  
  def project_compressed_log_set(compressed_log,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.compressed_log = compressed_log
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      #puts result
      if result == 0
        puts "compressed_log set to #{compressed_log}"
      else
        puts "Error with project_compressed_log_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_compression_type_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      #puts result.compression
      return result.compression
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end
  
  def project_compression_type_set(compression,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.compression = compression
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      #puts result
      if result == 0
        puts "compression_type set to #{compression}"
      else
        puts "Error with project_compression_type_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_intended_protocol_list_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = TRUE
    begin
      #Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      # puts result.intended_protocol_list.inspect
      return result.intended_protocol_list
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi: #{error["message"]}"
    end
  end
  
  def project_intended_protocol_list_set(intended_protocols,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::ProjectV21.new
    project_properties.intended_protocol_list = intended_protocols
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = project_properties
    begin
      #Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      #puts result
      if result.value == 0
        puts "intended_protocol_list set to #{intended_protocols}"
      else
        puts "Error with project_intended_protocol_list_set"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{error["message"]}"
      fail
    end
  end

  def project_lun_mapping_get(pool_name,project_name)
    api_instance = IFClient::SANApi.new
    get_project_default_iscsi_it_view_param = IFClient::GetProjectDefaultIscsiITViewParam.new
    get_project_default_iscsi_it_view_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      ##List all of the default iSCSI views of the project in Array<ITViewV21> format
      result = api_instance.get_project_default_iscsi_it_view_post(get_project_default_iscsi_it_view_param)
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(project_lun_mapping_get): #{error["message"]}"
      fail
    end 
  end

  def project_lun_mapping_set_add(pool_name,project_name,lun_mappings_array)
    api_instance = IFClient::SANApi.new
    create_mapping_for_project_param = IFClient::CreateMappingForProjectParam.new
    create_mapping_for_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    create_mapping_for_project_param.arg1_initiator_group_name = lun_mappings_array[0]
    create_mapping_for_project_param.arg2_target_group_name = lun_mappings_array[1]
    create_mapping_for_project_param.arg3_read_only = lun_mappings_array[3]
    begin
      ##Create a project level default mapping
      result = api_instance.create_mapping_for_project_post(create_mapping_for_project_param)
      #puts result.inspect
      if result.value == 0
        puts "#{lun_mappings_array[0]}/#{lun_mappings_array[1]} mapping created"
      else
        puts "Error with project_lun_mapping_set_add"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(project_lun_mapping_set_add): #{error["message"]}"
      fail
    end 
  end

  def project_lun_mapping_set_delete(pool_name,project_name,lun_mappings_array)
    api_instance = IFClient::SANApi.new
    delete_mapping_from_project_param = IFClient::DeleteMappingFromProjectParam.new
    delete_mapping_from_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    delete_mapping_from_project_param.arg1_initiator_group_name = lun_mappings_array[0]
    delete_mapping_from_project_param.arg2_target_group_name = lun_mappings_array[1]
    begin
      ##Deletes the view (mapping) between the given project, initiator group, and target group.
      result = api_instance.delete_mapping_from_project_post(delete_mapping_from_project_param)
      #puts result.inspect
      if result.value == 0
        puts "#{lun_mappings_array[0]}/#{lun_mappings_array[1]} mapping removed"
      else
        puts "Error with project_lun_mapping_set_delete"
      end
      rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling TegileApi(project_lun_mapping_set_delete): #{error["message"]}"
        fail
    end
  end

  def project_nfs_network_acls_get(pool_name,project_name)
    api_instance = IFClient::NasApi.new
    get_nfs_network_ac_ls_on_project_param = IFClient::GetNFSNetworkACLsOnProjectParam.new
    get_nfs_network_ac_ls_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      ##Returns all the Network ACLs for the NFS Project as Array<NetworkACLV21>
      result = api_instance.get_nfs_network_ac_ls_on_project_post(get_nfs_network_ac_ls_on_project_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(project_nfs_network_acls_get): #{error["message"]}"
      fail
    end   
  end

  def project_nfs_network_acls_set_add(pool_name,project_name,net_acl_array)
    api_instance = IFClient::NasApi.new
    add_nfs_network_acl_on_project_param = IFClient::AddNFSNetworkACLOnProjectParam.new
    add_nfs_network_acl_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    add_nfs_network_acl_on_project_param.arg1_type = net_acl_array[0]
    add_nfs_network_acl_on_project_param.arg2_host = net_acl_array[1]
    add_nfs_network_acl_on_project_param.arg3_access_mode = net_acl_array[2]
    add_nfs_network_acl_on_project_param.arg4_is_root = net_acl_array[3]
    begin
      ##Add network ACL to NFS Project
      result = api_instance.add_nfs_network_acl_on_project_post(add_nfs_network_acl_on_project_param)
      # puts result.inspect
      if result.value == 0
        puts "network acl for #{net_acl_array[1]} created"
      else
        puts "Error with project_nfs_network_acls_set_add"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(project_nfs_network_acls_set_add): #{error["message"]}"
    end 
  end

  def project_nfs_network_acls_set_delete(pool_name,project_name,net_acl_array)
    api_instance = IFClient::NasApi.new
    remove_nfs_network_acl_on_project_param = IFClient::RemoveNFSNetworkACLOnProjectParam.new
    remove_nfs_network_acl_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    remove_nfs_network_acl_on_project_param.arg1_type = net_acl_array[0]
    remove_nfs_network_acl_on_project_param.arg2_host = net_acl_array[1]
    begin
      ##Remove network ACL from NFS Project
      result = api_instance.remove_nfs_network_acl_on_project_post(remove_nfs_network_acl_on_project_param)
      # puts result.inspect
      if result.value == 0
        puts "network acl for #{net_acl_array[1]} removed"
      else
        puts "Error with project_nfs_network_acls_set_delete"
      end
      rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling TegileApi(project_nfs_network_acls_set_delete): #{error["message"]}"
        fail
    end
  end

  def share_nfs_network_acls_get(pool_name,project_name,share_name)
    api_instance = IFClient::NasApi.new
    get_nfs_network_ac_ls_on_share_param = IFClient::GetNFSNetworkACLsOnShareParam.new
    get_nfs_network_ac_ls_on_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      ##Returns all the Network ACLs for the NFS share in Array<NetworkACLV21> format
      result = api_instance.get_nfs_network_ac_ls_on_share_post(get_nfs_network_ac_ls_on_share_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(share_nfs_network_acls_get): #{error["message"]}"
      fail
    end   
  end

  def share_nfs_network_acls_set_add(pool_name,project_name,share_name,net_acl_array)
    api_instance = IFClient::NasApi.new
    add_nfs_network_acl_on_param = IFClient::AddNFSNetworkACLOnParam.new
    add_nfs_network_acl_on_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    add_nfs_network_acl_on_param.arg1_type = net_acl_array[0]
    add_nfs_network_acl_on_param.arg2_host = net_acl_array[1]
    add_nfs_network_acl_on_param.arg3_access_mode = net_acl_array[2]
    add_nfs_network_acl_on_param.arg4_is_root = net_acl_array[3]
    begin
      ##Add network ACL to NFS share
      result = api_instance.add_nfs_network_acl_on_share_post(add_nfs_network_acl_on_param)
      # puts result.inspect
      if result.value == 0
        puts "network acl for #{net_acl_array[1]} created"
      else
        puts "Error with TegileApi(share_nfs_network_acls_set_add)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(share_nfs_network_acls_set_add): #{error["message"]}"
    end 
  end

  def share_nfs_network_acls_set_delete(pool_name,project_name,share_name,net_acl_array)
    api_instance = IFClient::NasApi.new
    remove_nfs_network_acl_on_share_param = IFClient::RemoveNFSNetworkACLOnShareParam.new
    remove_nfs_network_acl_on_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    remove_nfs_network_acl_on_share_param.arg1_type = net_acl_array[0]
    remove_nfs_network_acl_on_share_param.arg2_host = net_acl_array[1]
    begin
      ##Remove network ACL from NFS Project
      result = api_instance.remove_nfs_network_acl_on_share_post(remove_nfs_network_acl_on_share_param)
      # puts result.inspect
      if result.value == 0
        puts "network acl for #{net_acl_array[1]} removed"
      else
        puts "Error with TegileApi(share_nfs_network_acls_set_delete)"
      end
      rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling TegileApi(share_nfs_network_acls_set_delete): #{error["message"]}"
        fail
    end
  end

  def lun_lun_mappings_get(pool_name,project_name,lun_name)
    api_instance = IFClient::SANApi.new
    get_volume_it_view_param = IFClient::GetVolumeITViewParam.new
    get_volume_it_view_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    begin
      ##List all of the existing views of the volume and return in Array<ITViewV21>
      result = api_instance.get_volume_it_view_post(get_volume_it_view_param)
      # puts "lun_mapping_get: #{result.inspect}"
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(lun_lun_mappings_get): #{error["message"]}"
      fail
    end 
  end

  ## Used to create lun_mappings
  ## "itviewv21_array" should be array of it_view_v21 objects
  def lun_mappings_create(pool_name,project_name,lun_name,itviewv21_array)
    api_instance = IFClient::SANApi.new
    create_mapping_for_volume_param = IFClient::CreateMappingForVolumeParam.new
    create_mapping_for_volume_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    create_mapping_for_volume_param.arg1_initiator_group_name = itviewv21_array.host_group_name
    create_mapping_for_volume_param.arg2_target_group_name = itviewv21_array.target_group_name
    create_mapping_for_volume_param.arg3_lun_number = itviewv21_array.lun_nbr
    create_mapping_for_volume_param.arg4_read_only = itviewv21_array.read_only
    begin
      ##Maps a volume to an initiator group and a target group.
      result = api_instance.create_mapping_for_volume_post(create_mapping_for_volume_param)
      # puts result.inspect
      if result.value == 0
        puts "mapping for #{itviewv21_array.host_group_name}/#{itviewv21_array.target_group_name}/lun##{itviewv21_array.lun_nbr} created"
      else
        puts "Error with TegileApi(lun_lun_mappings_set_add)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(lun_mappings_create): #{error["message"]}"
    end 
  end

  ## Used to delete lun_mappings
  ## "itviewv21_array" should be array of it_view_v21 objects
  def lun_mappings_delete(pool_name,project_name,lun_name,itviewv21_array)
    api_instance = IFClient::SANApi.new
    delete_mapping_from_volume_param = IFClient::DeleteMappingFromVolumeParam.new
    delete_mapping_from_volume_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    delete_mapping_from_volume_param.arg1_initiator_group_name = itviewv21_array.host_group_name
    delete_mapping_from_volume_param.arg2_target_group_name = itviewv21_array.target_group_name
    begin
      ##Deletes the view (mapping) between the given volume, initiator group, and target group.
      result = api_instance.delete_mapping_from_volume_post(delete_mapping_from_volume_param)
      # puts result.inspect
      if result.value == 0
        puts "mapping for #{itviewv21_array.host_group_name}/#{itviewv21_array.target_group_name}/lun##{itviewv21_array.lun_nbr} deleted"
      else
        puts "Error with TegileApi(lun_mappings_delete)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(lun_mappings_delete): #{error["message"]}"
    end 
  end

  def share_block_size_get(pool_name,project_name,share_name)
    api_instance = IFClient::DataApi.new
    get_share_param = IFClient::GetShareParam.new
    get_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      ##Get the Share details.
      result = api_instance.get_share_post(get_share_param)
      # puts result.record_size.value
      return result.record_size.value
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_block_size_get): #{error["message"]}"
    end 
  end

  def share_block_size_set(block_size,pool_name,project_name,share_name)
    api_instance = IFClient::DataApi.new
    modify_share = IFClient::ShareV21.new
    modify_share.record_size = block_size
    modify_share_properties_param = IFClient::ModifySharePropertiesParam.new
    modify_share_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    modify_share_properties_param.arg1_share = modify_share
    begin
      ##Modify value of a subset of project properties
      result = api_instance.modify_share_properties_post(modify_share_properties_param)
      puts result.inspect
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(share_block_size_set): #{error["message"]}"
      fail
    end 
  end


end






module RubyMethods

  def RubyMethods.network_acl_v21_to_array(networkaclv21_array)
    return_array = []
    networkaclv21_array.each do |sub_array|
      temp_array = []
      temp_array[0] = sub_array.host_type
      temp_array[1] = sub_array.host
      temp_array[2] = sub_array.access_mode
      temp_array[3] = sub_array.root_access_for_nfs
      return_array << temp_array
    end
    return return_array
  end

  def RubyMethods.array_to_network_acl_v21(array)
    return_array = []
    array.each do |sub_array|
      temp_array = IFClient::NetworkACLV21.new
      temp_array.host_type = sub_array[0]
      temp_array.host = sub_array[1]
      temp_array.access_mode = sub_array[2]
      temp_array.root_access_for_nfs = sub_array[3]
      return_array << temp_array
    end
    return return_array
  end

  def RubyMethods.it_view_v21_to_array(itviewv21_array)
    return_array = []
    itviewv21_array.each do |sub_array|
      temp_array = []
      temp_array[0] = sub_array.host_group_name
      temp_array[1] = sub_array.target_group_name
      temp_array[2] = sub_array.lun_nbr
      temp_array[3] = sub_array.read_only
      return_array << temp_array
    end
    return return_array
  end

  ##Used to convert standard array from manifest into it_view_v21 object
  ##Accepts array of arrays and returns array of it_view_v21 objects
  def RubyMethods.array_of_arrays_to_it_view_v21(array_of_arrays)
    return_array = []
    array_of_arrays.each do |sub_array|
        array = IFClient::ITViewV21.new
        array.host_group_name = sub_array[0]
        array.target_group_name = sub_array[1]
        array.lun_nbr = sub_array[2]
        array.read_only = sub_array[3]
        return_array << array
    end
    return return_array
  end

  ##Used to find what lun_mappings need to be added
  ##Finds "should" entries missing from "is"
  ##Takes array of arrays of it_view_v21 objects and returns the same
  def RubyMethods.find_it_view_v21_to_create(should,is)
    matches_found = []
    should.each do |sub_array1|
      is.each do |sub_array2| 
        if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
          # puts "match found for #{sub_array1}"
          matches_found << sub_array1
        end
      end
    end
    missing = should - matches_found
    return missing 
  end

  ##Used to find what needs to be deleted from lun_mappings
  ##Finds "is" entries missing from "should"
  ##Takes array of arrays of it_view_v21 objects and returns the same
  def RubyMethods.find_it_view_v21_to_delete(should,is)
    matches_found = []
    is.each do |sub_array1|
      should.each do |sub_array2| 
        if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
          # puts "match found for #{sub_array1}"
          matches_found << sub_array1
        end
      end
    end
    extra = is - matches_found
    return extra 
  end

  ##Used to find what needs to be deleted from lun_mappings, also compares lun_num&read_only if not set to -1
  ##Finds "is" entries missing from "should"
  ##Takes array of arrays of it_view_v21 objects and returns the same
  def RubyMethods.find_it_view_v21_to_delete_lun(should,is)
    matches_found = []
    is.each do |sub_array1|
      should.each do |sub_array2| 
            if sub_array2.lun_nbr == -1
                if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
                    # puts "-1 match found for #{sub_array1}"
                    matches_found << sub_array1
                end        
            else
                if sub_array1 == sub_array2
                    # puts "match found for #{sub_array1}"
                    matches_found << sub_array1
                end
            end
        end
    end
    extra = is - matches_found
    return extra 
  end

  ##Used to find what needs to be added to lun_mappings, also compares lun_num&read_only if not set to -1
  ##Finds "should" entries missing from "is"
  ##Takes array of arrays of it_view_v21 objects and returns the same
  def RubyMethods.find_it_view_v21_to_create_lun(should,is)
    matches_found = []
    should.each do |sub_array1|
        is.each do |sub_array2| 
            if sub_array1.lun_nbr == -1
                if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
                    # puts "-1 match found for #{sub_array1}"
                    matches_found << sub_array1
                end
            else
                if sub_array1 == sub_array2
                    # puts "match found for #{sub_array1}"
                    matches_found << sub_array1  
                end
            end
        end
    end
    missing = should - matches_found
    return missing 
  end

end
