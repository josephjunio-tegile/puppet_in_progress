require 'tegile-api'

class TegileApi

  def initialize(host,username,password)
    IFClient.configure do |config|
      config.username = username
      config.password = password
      config.host = host
      config.verify_ssl = false
      config.verify_ssl_host = false
    end
    list_system_properties
    puts "IFClient Configured with #{host} and #{username}"
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
      error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi(project_exists): #{error["message"]}"
    end 
  end

  def project_create(project_name,pool_name,compression_class,compression_type,compressed_log,intended_protocol_list,quota,dedup,primary_cache,secondary_cache,acl_inherit,default_lun_size,default_lun_block_size,default_thin_provisioning,default_share_block_size,mount_point)
    api_instance = IFClient::DataApi.new
    compression_class_inst = IFClient::CompressionClass.new
    compression_class_inst.value = compression_class
    new_project = IFClient::Project_V2_1.new
    new_project.project_name = project_name
    new_project.pool_name = pool_name
    new_project.compression_class = compression_class_inst
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
    new_project.mount_point = mount_point
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

  ## Method to enable/disable SMB on project
  ## Used by share_protocol property "=" method 
  def project_set_smb_sharing(project_name,pool_name,enabled)
    api_instance = IFClient::NasApi.new
    set_smb_sharing_on_project_param = IFClient::SetSMBSharingOnProjectParam.new
    set_smb_sharing_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    set_smb_sharing_on_project_param.arg1_turn_on = enabled
    begin
      ##Enable/Disable SMB protocol for a Project, If the dataset contains any network ACLs, they are removed as well.
      result = api_instance.set_smb_sharing_on_project_post(set_smb_sharing_on_project_param)
      # puts result.inspect
      if result.value == 0 && enabled == true
        puts "smb enabled"
      elsif result.value == 0 && enabled == false
        puts "smb disabled"
      else
        fail "Error with TegileApi(project_set_smb_sharing)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(project_set_smb_sharing): #{error["message"]}"
    end 
  end

  ##Can move into project_get?
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
  
  ##Can move into project_set?
  def project_intended_protocol_list_set(intended_protocols,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    project_properties = IFClient::Project_V2_1.new
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

  ## Method using the tegile api to get all project properties
  ## Used by puppet project_property_get methods
  def project_get(pool_name,project_name)
    api_instance = IFClient::DataApi.new
    get_project_param = IFClient::GetProjectParam.new
    get_project_param.arg0_pool_name = pool_name
    get_project_param.arg1_project_name = project_name
    get_project_param.arg2_local = true
    begin
      ##Get the Project details.
      result = api_instance.get_project_post(get_project_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(project_get): #{error["message"]}"
    end
  end

  ## Method using the tegile api to set any project property, case statement has to be updated for properties that need support
  ## Used by puppet project_property_set methods
  def project_set(property,property_value,pool_name,project_name)
    api_instance = IFClient::DataApi.new
    modify_project = IFClient::Project_V2_1.new
    case property
    when "default_volume_size_in_byte"
      modify_project.default_volume_size_in_byte = property_value
    when "default_volume_block_size"
      modify_project.default_volume_block_size = property_value
    when "primary_cache"
      modify_project.primary_cache = property_value
    when "secondary_cache"
      modify_project.secondary_cache = property_value
    when "acl_inherit"
      modify_project.acl_inherit = property_value
    when "record_size"
      modify_project.record_size = property_value
    when "readonly"
      modify_project.readonly = property_value
    when "default_thin_provisioning"
      modify_project.default_thin_provisioning = property_value
    when "dedup"
      modify_project.dedup = property_value
    when "quota"
      modify_project.quota_in_byte = property_value
    when "compressed_log"
      modify_project.compressed_log = property_value
    when "compression_type"
      modify_project.compression = property_value
    when "compression_class"
      modify_project.compression_class = property_value
    end
    modify_project_properties_param = IFClient::ModifyProjectPropertiesParam.new
    modify_project_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    modify_project_properties_param.arg1_project = modify_project
    begin
      ##Modify value of a subset of Project properties
      result = api_instance.modify_project_properties_post(modify_project_properties_param)
      if result.value == 0
        # puts result.inspect
        puts "set #{property} to #{property_value}"
      else
        fail "Error with TegileApi(project_set)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(project_set): #{error["message"]}"
    end 
  end

  ## Method to check status of nfs sharing on a project
  ## used by intended_protocol_list get method to check if nfs is enabled
  def project_exposed_over_nfs(pool_name,project_name)
    api_instance = IFClient::NasApi.new
    is_project_exposed_over_nfs_param = IFClient::IsProjectExposedOverNFSParam.new
    is_project_exposed_over_nfs_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      #Returns whether the NFS protocol is enabled for the Project
      result = api_instance.is_project_exposed_over_nfs_post(is_project_exposed_over_nfs_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(project_exposed_over_nfs): #{error["message"]}"
    end
  end

   ## Method to check status of smb sharing on a project
   ## used by intended_protocol_list get method to check if nfs is enabled
  def project_exposed_over_smb(pool_name,project_name)
    api_instance = IFClient::NasApi.new
    is_project_exposed_over_smb_param = IFClient::IsProjectExposedOverSMBParam.new
    is_project_exposed_over_smb_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    begin
      #Returns whether the SMB protocol is enabled for the Project
      result = api_instance.is_project_exposed_over_smb_post(is_project_exposed_over_smb_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(project_exposed_over_smb): #{error["message"]}"
    end
    
  end

  ## Method to enable/disable NFS on project
  ## Used by share_protocol property "=" method 
  def project_set_nfs_sharing(project_name,pool_name,enabled)
    api_instance = IFClient::NasApi.new
    set_nfs_sharing_on_project_param = IFClient::SetNFSSharingOnProjectParam.new
    set_nfs_sharing_on_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
    set_nfs_sharing_on_project_param.arg1_turn_on = enabled
    begin
      ##Enable/Disable NFS protocol for a Project
      result = api_instance.set_nfs_sharing_on_project_post(set_nfs_sharing_on_project_param)
      #puts result
      if result.value == 0 && enabled == true
        puts "nfs enabled"
      elsif result.value == 0 && enabled == false
        puts "nfs disabled"
      else
        fail "Error with TegileApi(project_set_nfs_sharing)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(project_set_nfs_sharing): #{error["message"]}"
    end 
  end





  def share_create(pool_name,project_name,share_name,mount_point) #,block_size
    api_instance = IFClient::DataApi.new
    ##Set share option params
    new_share_options = IFClient::ShareOptions.new
    new_share_options.block_size = ""
    new_share_options.mount_point = mount_point
    new_share_options.quota = -1
    new_share_options.reservation = -1
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

  ##rename for "net_acl"
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

  ##rename for "net_acl"
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

  ## Method using the tegile api to get all share property
  ## Used by puppet share_property_get methods
  def share_get(pool_name,project_name,share_name)
    api_instance = IFClient::DataApi.new
    get_share_param = IFClient::GetShareParam.new
    get_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      ##Get the Share details.
      result = api_instance.get_share_post(get_share_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_get): #{error["message"]}"
    end 
  end

  ## Method using the tegile api to set any share property, case statement has to be updated for properties that need support
  ## Used by puppet share_property_set methods
  def share_set(property,property_value,pool_name,project_name,share_name)
    api_instance = IFClient::DataApi.new
    modify_share = IFClient::Share_V2_1.new
    case property
    when "dedup"
      modify_share.dedup = property_value
    when "compression"
      modify_share.compression = property_value
    when "quota"
      modify_share.quota_in_byte = property_value
    when "reservation"
      modify_share.reservation_in_byte = property_value
    when "readonly"
      modify_share.readonly = property_value
    when "logbias"
      modify_share.logbias = property_value
    when "primary_cache"
      modify_share.primary_cache = property_value
    when "secondary_cache"
      modify_share.secondary_cache = property_value
    when "acl_inherit"
      modify_share.acl_inherit = property_value
    when "block_size"
      modify_share.record_size = property_value
    when "compression_class"
      modify_share.compression_class = property_value
    when "access_time"
      modify_share.atime = property_value
    when "nbmand"
      modify_share.nbmand = property_value
    end
    modify_share_properties_param = IFClient::ModifySharePropertiesParam.new
    modify_share_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    modify_share_properties_param.arg1_share = modify_share
    begin
      ##Modify value of a subset of project properties
      result = api_instance.modify_share_properties_post(modify_share_properties_param)
      if result.value == 0
        # puts result.inspect
        puts "set #{property} to #{property_value}"
      else
        fail "Error with TegileApi(share_set)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_set): #{error["message"]}"
    end 
  end

  ## Method to check status of nfs sharing on a share
  ## used by share_protocol is method to check if nfs is enabled
  def share_exposed_over_nfs(pool_name,project_name,share_name)
    api_instance = IFClient::NasApi.new
    is_share_exposed_over_nfs_param = IFClient::IsShareExposedOverNFSParam.new
    is_share_exposed_over_nfs_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      #Returns whether the NFS protocol is enabled for the share
      result = api_instance.is_share_exposed_over_nfs_post(is_share_exposed_over_nfs_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_exposed_over_nfs): #{error["message"]}"
    end
  end

  ## Method to check status of smb sharing on a share
  ## used by share_protocol is method to check if smb is enabled
  def share_exposed_over_smb(pool_name,project_name,share_name)
    api_instance = IFClient::NasApi.new
    is_share_exposed_over_smb_param = IFClient::IsShareExposedOverSMBParam.new
    is_share_exposed_over_smb_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    begin
      #Returns whether the SMB protocol is enabled for the share
      result = api_instance.is_share_exposed_over_smb_post(is_share_exposed_over_smb_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_exposed_over_smb): #{error["message"]}"
    end
  end

  ## Method to enable/disable NFS on share
  ## Used by share_protocol property "=" method 
  def share_set_nfs_sharing(pool_name,project_name,share_name,enabled)
    api_instance = IFClient::NasApi.new
    set_nfs_sharing_on_share_param = IFClient::SetNFSSharingOnShareParam.new
    set_nfs_sharing_on_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    set_nfs_sharing_on_share_param.arg1_turn_on = enabled
    begin
      #Enable/Disable NFS protocol for a share. If the dataset contains any network ACLs, they will be removed as well.
      result = api_instance.set_nfs_sharing_on_share_post(set_nfs_sharing_on_share_param)
      # puts result.inspect
      if result.value == 0 && enabled == true
        # puts "nfs enabled"
      elsif result.value == 0 && enabled == false
        # puts "nfs disabled"
      else
        fail "Error with TegileApi(share_set_nfs_sharing)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_set_nfs_sharing): #{error["message"]}"
    end 
  end

  ## Method to enable/disable SMB on share
  ## Used by share_protocol property "=" method 
  def share_set_smb_sharing(pool_name,project_name,share_name,enabled)
    api_instance = IFClient::NasApi.new
    set_smb_sharing_on_share_param = IFClient::SetSMBSharingOnShareParam.new
    set_smb_sharing_on_share_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{share_name}"
    set_smb_sharing_on_share_param.arg1_turn_on = enabled
    set_smb_sharing_on_share_param.arg2_display_name = "#{project_name}-#{share_name}"
    set_smb_sharing_on_share_param.arg3_enable_guest_mode = false
    begin
      #Enable/Disable SMB protocol for a share. If the dataset contains any network ACLs, they will be removed as well.
      result = api_instance.set_smb_sharing_on_share_post(set_smb_sharing_on_share_param)
      # puts result.inspect
      if result.value == 0 && enabled == true
        # puts "smb enabled"
      elsif result.value == 0 && enabled == false
        # puts "smb disabled"
      else
        fail "Error with TegileApi(share_set_smb_sharing)"
      end
    rescue IFClient::ApiError => e
      # error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(share_set_smb_sharing): #{e}"  #rror["message"]
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

  def lun_create(lun_name,pool_name,project_name,lun_protocol,lun_size,block_size,thin_provision)
    api_instance = IFClient::DataApi.new
    #Set volume params
    new_vol = IFClient::Volume_V1_0.new
    new_vol.name = lun_name
    new_vol.pool_name = pool_name
    new_vol.project_name = project_name
    new_vol.protocol = lun_protocol
    new_vol.vol_size = lun_size
    #new_vol.block_size = IFClient::BlockSizeEnum::N32_KB  ##ReferencesBlockSizeEnum
    new_vol.block_size = block_size
    new_vol.thin_provision = thin_provision
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
  
  ## Method using the tegile api to get all lun properties
  ## Used by puppet lun_property_get methods
  def lun_get(pool_name,project_name,lun_name)
    api_instance = IFClient::DataApi.new
    get_volume_param = IFClient::GetVolumeParam.new
    get_volume_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    begin
      ##Get the Volume details
      result = api_instance.get_volume_post(get_volume_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(lun_get): #{error["message"]}"
    end 
  end

  ## Method using the tegile api to set any lun property, case statement has to be updated for properties that need support
  ## Used by puppet lun_property_set methods
  def lun_set(property,property_value,pool_name,project_name,lun_name)
    api_instance = IFClient::DataApi.new
    modify_lun = IFClient::Volume_V2_1.new
    case property
    when "compression"
      modify_lun.compression = property_value
    when "compressed_log"
      modify_lun.compressed_log = property_value
    when "dedup"
      modify_lun.dedup = property_value
    when "primary_cache"
      modify_lun.primary_cache = property_value
    when "secondary_cache"
      modify_lun.secondary_cache = property_value
    when "readonly"
      modify_lun.readonly = property_value
    when "logbias"
      modify_lun.logbias = property_value
    when "write_back_cache"
      modify_lun.write_back_cache = property_value
    when "compression_class"
      modify_lun.compression_class = property_value
    end
    modify_volume_properties_param = IFClient::ModifyVolumePropertiesParam.new
    modify_volume_properties_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{lun_name}"
    modify_volume_properties_param.arg1_volume = modify_lun
    begin
      #Modify value of a subset of Volume properties
      result = api_instance.modify_volume_properties_post(modify_volume_properties_param)
      if result.value == 0
        # puts result.inspect
        puts "set #{property} to #{property_value}"
      else
        fail "Error with TegileApi(lun_set)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(lun_set): #{error["message"]}"
    end 
  end







  def initiator_group_exists(initiator_group_name)
    api_instance = IFClient::SANApi.new
    begin
      ##Lists all the iSCSI initiator groups available on a Tegile array.
      result = api_instance.list_initiator_groups_get
      # puts result.inspect
      exists = nil
      result.each do |x|
        if x.initiator_group_name == initiator_group_name
          exists = true
          puts "found #{x.initiator_group_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      fail "Exception when calling SANApi->list_iscsi_initiator_groups_get: #{e}"
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
      fail "Exception when calling TegileApi(initiator_group_create): #{error["message"]}"
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
      # puts result.inspect
      exists = nil
      result.each do |x|
        if x.initiator_name == initiator_name
          exists = true
          puts "found #{x.initiator_name}"
        end
      end
      return exists
    rescue IFClient::ApiError => e
      fail "Exception when calling SANApi->list_iscsi_initiators_post: #{e}"
    end
  end

  def initiator_create(initiator_name,initiator_chap_user_name,initiator_chap_secret)
    api_instance = IFClient::SANApi.new
    new_initiator = IFClient::IscsiInitiator_V1_0.new
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
        fail "Error with TegileApi(initiator_create)"
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

  #*Used by initiator_group provider member= & create method
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
        fail "Error with TegileApi(add_initiator_to_initiator_group)"
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

  #!not needed exists anymore, using just list method
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
        fail "Error with TegileApi(iscsi_target_group_create)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(iscsi_target_group_create): #{error["message"]}"
    end 
  end

  #!shouldnt be needed with list all avilable
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
        fail "Error with TegileApi(iscsi_target_group_delete)"
      end
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        fail "Exception when calling TegileApi(iscsi_target_group_delete): #{error["message"]}"
    end
  end

  #!what is this fix for??
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
          puts "found: #{x.target_name}"
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
    new_iscsi_target = IFClient::ISCSITargetCreate_V2_1.new
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

  ##
  def initiator_group_members_get(initiator_group_name)
    api_instance = IFClient::SANApi.new
    list_initiators_in_initiator_group_param = IFClient::ListInitiatorsInInitiatorGroupParam.new
    list_initiators_in_initiator_group_param.arg0_initiator_group_name = initiator_group_name
    begin
      ##Lists all initiators belonging to the specified initiator group
      result = api_instance.list_initiators_in_initiator_group_post(list_initiators_in_initiator_group_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(initiator_group_members_get): #{error["message"]}"
    end
  end

  #*
  def initiator_group_members_set_add_to_group(initiator_group_name,initiator_name)
    api_instance = IFClient::SANApi.new
    add_initiator_to_initiator_group_param = IFClient::AddInitiatorToInitiatorGroupParam.new
    add_initiator_to_initiator_group_param.arg0_initiator_name = initiator_name
    add_initiator_to_initiator_group_param.arg1_initiator_group_name = initiator_group_name
    begin
      #Associates an initiator with an initiator group.
      result = api_instance.add_initiator_to_initiator_group_post(add_initiator_to_initiator_group_param)
      puts result.inspect
      if result.value == 0
        puts "initiator:#{initiator_name} added to initiator_group:#{initiator_group_name}"
      else
        fail "Error with TegileApi(initiator_group_members_set_add_to_group)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(initiator_group_members_set_add_to_group) #{error["message"]}"
    end
  end

  #*basic method from sdk to move initiator into new group
  def move_initiator_to_initiator_group(initiator_name,new_initiator_group_name,force)
    api_instance = IFClient::SANApi.new
    move_initiator_to_initiator_group_param = IFClient::MoveInitiatorToInitiatorGroupParam.new
    move_initiator_to_initiator_group_param.arg0_initiator_name = initiator_name
    move_initiator_to_initiator_group_param.arg1_new_initiator_group_name = new_initiator_group_name
    move_initiator_to_initiator_group_param.arg2_force = force
    begin
      #*Move an iSCSI or Fibre Channel Initiator to an existing Initiator Group.
      result = api_instance.move_initiator_to_initiator_group_post(move_initiator_to_initiator_group_param)
      if result.value == 0
        puts "#{initiator_name} moved to #{new_initiator_group_name}"
      else
        fail "Error with TegileApi(move_initiator_to_initiator_group)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(move_initiator_to_initiator_group) #{error["message"]}"
    end
  end

  #*Custom method to remove initiator from group. creates temp group, moves initiator to it, and removes group
  def remove_initiator_from_group(initiator_name)
    #*setup params
    api_instance = IFClient::SANApi.new
    ran_num = rand(1000)
    create_initiator_group_param = IFClient::CreateInitiatorGroupParam.new
    create_initiator_group_param.arg0_initiator_group_name = "temp-group-#{ran_num}"
    move_initiator_to_initiator_group_param = IFClient::MoveInitiatorToInitiatorGroupParam.new
    move_initiator_to_initiator_group_param.arg0_initiator_name = initiator_name
    move_initiator_to_initiator_group_param.arg1_new_initiator_group_name = "temp-group-#{ran_num}"
    move_initiator_to_initiator_group_param.arg2_force = true
    delete_initiator_group_param = IFClient::DeleteInitiatorGroupParam.new
    delete_initiator_group_param.arg0_initiator_group_name = "temp-group-#{ran_num}"
    begin
      #*Creates an initiator group on a Tegile array.
      result1 = api_instance.create_initiator_group_post(create_initiator_group_param)
      result2 = api_instance.move_initiator_to_initiator_group_post(move_initiator_to_initiator_group_param)
      result3 = api_instance.delete_initiator_group_post(delete_initiator_group_param)
      if result1.value != 0
        fail "Error with TegileApi(remove_initiator_from_group_1)"
      elsif result2.value != 0
        fail "Error with TegileApi(remove_initiator_from_group_2)"
      elsif result3.value != 0
        fail "Error with TegileApi(remove_initiator_from_group_3)"
      else
        puts "#{initiator_name} removed from initiator_group"
      end
      #*output used to watch full method progress
      # if result1.value == 0
      #   puts "temp-group-#{ran_num} created"
      # else
      #   fail "Error with TegileApi(remove_initiator_from_group_1)"
      # end
      # if result2.value == 0
      #   puts "#{initiator_name} moved to temp-group-#{ran_num}"
      # else
      #   fail "Error with TegileApi(remove_initiator_from_group_2)"
      # end
      # if result3.value == 0
      #   puts "temp-group-#{ran_num} deleted"
      # else
      #   fail "Error with TegileApi(remove_initiator_from_group_3)"
      # end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(remove_initiator_from_group): #{error["message"]}"
    end
  end

  #*Custom method to remove target from group. creates temp group, moves target to it, and removes group
  #*used by iscsi_target_group members method
  def remove_target_from_group(iscsi_target_name,pool_name)
    #*setup params for all api calls
    api_instance = IFClient::SANApi.new
    ran_num = rand(1000)
    create_target_group_param = IFClient::CreateTargetGroupParam.new
    create_target_group_param.arg0_target_group_name = "temp-group-#{ran_num}"
    create_target_group_param.arg1_pool_name = pool_name
    move_target_to_target_group_param = IFClient::MoveTargetToTargetGroupParam.new
    move_target_to_target_group_param.arg0_target_name = iscsi_target_name
    move_target_to_target_group_param.arg1_new_target_group_name = "temp-group-#{ran_num}"
    move_target_to_target_group_param.arg2_force = true
    delete_target_group_param = IFClient::DeleteTargetGroupParam.new
    delete_target_group_param.arg0_target_group_name = "temp-group-#{ran_num}"
    begin
      #*create temp group
      result1 = api_instance.create_target_group_post(create_target_group_param)
      #*move the target to temp group
      result2 = api_instance.move_target_to_target_group_post(move_target_to_target_group_param)
      #*delete the temp group
      result3 = api_instance.delete_target_group_post(delete_target_group_param)
      if result1.value != 0
        fail "Error with TegileApi(remove_target_from_group_1)"
      elsif result2.value != 0
        fail "Error with TegileApi(remove_target_from_group_2)"
      elsif result3.value != 0
        fail "Error with TegileApi(remove_target_from_group_3)"
      else
        puts "#{iscsi_target_name} removed from target_group"
      end
      #*Detailed logging for full method
      # if result1.value == 0
      #   puts "temp-group-#{ran_num} created"
      # else
      #   fail "Error with TegileApi(remove_target_from_group_1)"
      # end
      # if result2.value == 0
      #   puts "#{iscsi_target_name} moved to temp-group-#{ran_num}"
      # else
      #   fail "Error with TegileApi(remove_target_from_group_2)"
      # end
      # if result3.value == 0
      #   puts "temp-group-#{ran_num} deleted"
      # else
      #   fail "Error with TegileApi(remove_target_from_group_3)"
      # end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(remove_target_from_group): #{error["message"]}"
    end 
    
  end

  #*Used by initiator_group provider member= & create method
  def initiator_group_members_set_list_in_group(initiator_name)
    api_instance = IFClient::SANApi.new
    get_initiator_group_param = IFClient::GetInitiatorGroupParam.new
    get_initiator_group_param.arg0_initiator_name = initiator_name
    begin
      #*Gets the name of the initiator group to which the initiator belongs.
      result = api_instance.get_initiator_group_post(get_initiator_group_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(initiator_group_members_set_list_in_group) #{error["message"]}"
    end
  end

  ##
  def list_targets_in_target_group(target_group_name)
    api_instance = IFClient::SANApi.new
    list_targets_in_target_group_param = IFClient::ListTargetsInTargetGroupParam.new
    list_targets_in_target_group_param.arg0_target_group_name = target_group_name
    begin
      ##Lists all targets associated with the target group.
      result = api_instance.list_targets_in_target_group_post(list_targets_in_target_group_param)
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(list_targets_in_target_group) #{error["message"]}"
    end
  end

  ##
  def move_target_to_target_group(target_name,new_target_group_name,force)
    api_instance = IFClient::SANApi.new
    move_target_to_target_group_param = IFClient::MoveTargetToTargetGroupParam.new
    move_target_to_target_group_param.arg0_target_name = target_name
    move_target_to_target_group_param.arg1_new_target_group_name = new_target_group_name
    move_target_to_target_group_param.arg2_force = force
    begin
      ##Move a target specified with targetName to a new target group specified with newTargetGroupName
      result = api_instance.move_target_to_target_group_post(move_target_to_target_group_param)
      # puts result.inspect
      if result.value == 0
        puts "target:#{target_name} moved to target_group:#{new_target_group_name}"
      else
        fail "Error with TegileApi(move_target_to_target_group)"
      end
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(move_target_to_target_group) #{error["message"]}"
    end
  end

  #*returns all target groups, used by iscsi_target_group exists? method
  def list_target_groups
    api_instance = IFClient::SANApi.new
    begin
      #*List all target groups available on IntelliFlash Array
      result = api_instance.list_target_groups_get
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(list_target_groups) #{error["message"]}"
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

  def inherit_property_from_project(pool_name,project_name,vol_name,prop)
    api_instance = IFClient::DataApi.new
    inherit_property_from_project_param = IFClient::InheritPropertyFromProjectParam.new
    inherit_property_from_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}/#{vol_name}"
    inherit_property_from_project_param.arg1_prop_name = prop
    begin
    #Inherit properties from parent project settings (revert/rollback to parent setting)
    result = api_instance.inherit_property_from_project_post(inherit_property_from_project_param)
    # puts result.inspect
    return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(inherit_property_from_project_post): #{error["message"]}"
    end
  end

  def get_smb_config
    api_instance = IFClient::NasApi.new
    begin
      #Get SMB configuration
      result = api_instance.get_smb_config_get
      # puts result.inspect
      return result
    rescue IFClient::ApiError => e
      error = JSON.parse("#{e.response_body}")
      fail "Exception when calling TegileApi(get_smb_config): #{error["message"]}"
    end
  end



end

=begin  ##No longer used, moved to project_get/set
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
    project_properties = IFClient::Project_V2_1.new
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
    project_properties = IFClient::Project_V2_1.new
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
    project_properties = IFClient::Project_V2_1.new
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
    project_properties = IFClient::Project_V2_1.new
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
    project_properties = IFClient::Project_V2_1.new
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
    project_properties = IFClient::Project_V2_1.new
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
    project_properties = IFClient::Project_V2_1.new
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
  ##once test with 3.7.0.1 move to share_get
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
  ##once test with 3.7.0.1 move to share_set
  def share_block_size_set(block_size,pool_name,project_name,share_name)
    api_instance = IFClient::DataApi.new
    modify_share = IFClient::Share_V2_1.new
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
=end




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
      temp_array = IFClient::NetworkACL_V2_1.new
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
