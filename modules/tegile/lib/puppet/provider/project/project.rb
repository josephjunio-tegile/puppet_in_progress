require 'puppet/provider/tegile'

Puppet::Type.type(:project).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for project create/delete"
  Puppet.info("##Inside provider_root_project")

  def create
    Puppet.info("##Inside provider_project_create")
    tegile_api_transport.project_create(resource[:project_name],resource[:pool_name],resource[:compression_type],resource[:compressed_log],resource[:intended_protocol_list],resource[:quota],resource[:dedup],resource[:primary_cache],resource[:secondary_cache],resource[:acl_inherit],resource[:default_lun_size],resource[:default_lun_block_size],resource[:default_thin_provisioning],resource[:default_share_block_size])
    if resource[:intended_protocol_list] != nil
      enabled_protocols = resource[:intended_protocol_list].each {|x| x.downcase!}
      if enabled_protocols.include?("nfs")
        #puts "enabling nfs"
        tegile_api_transport.set_nfs_sharing_on(resource[:project_name],resource[:pool_name])
      end
      if enabled_protocols.include?("smb")
        #puts "enabling smb"
        tegile_api_transport.project_set_smb_sharing_on(resource[:project_name],resource[:pool_name])
      end
    end
    if resource[:lun_mappings] != nil
      resource[:lun_mappings].each do |sub_array|
        tegile_api_transport.project_lun_mapping_set_add(resource[:pool_name],resource[:project_name],sub_array)
      end
    end
    if resource[:nfs_network_acls] != nil
      resource[:nfs_network_acls].each do |sub_array|
        tegile_api_transport.project_nfs_network_acls_set_add(resource[:pool_name],resource[:project_name],sub_array)
      end
    end
  end

  def destroy
    Puppet.info("##Inside provider_project_destroy")
    fail "Deleting projects not supported"
  end

  def exists?
    Puppet.info("##Inside provider_project_exists")
    tegile_api_transport.project_exists(resource[:project_name],resource[:pool_name])
  end

  def default_share_block_size
    Puppet.info("##Inside provider_project_default_share_block_size_get")
    tegile_api_transport.project_default_share_block_size_get(resource[:pool_name],resource[:project_name])
  end

  def default_share_block_size=(value)
    Puppet.info("##Inside provider_project_default_share_block_size_set")
    tegile_api_transport.project_default_share_block_size_set(value,resource[:pool_name],resource[:project_name])
  end

  def default_thin_provisioning
    Puppet.info("##Inside provider_project_default_thin_provisioning_get")
    tegile_api_transport.project_default_thin_provisioning_get(resource[:pool_name],resource[:project_name])
  end

  def default_thin_provisioning=(value)
    Puppet.info("##Inside provider_project_default_thin_provisioning_set")
    tegile_api_transport.project_default_thin_provisioning_set(value,resource[:pool_name],resource[:project_name])
  end

  def default_lun_block_size
    Puppet.info("##Inside provider_project_default_lun_block_size_get")
    tegile_api_transport.project_default_lun_block_size_get(resource[:pool_name],resource[:project_name])
  end

  def default_lun_block_size=(value)
    Puppet.info("##Inside provider_project_default_lun_block_size_set")
    tegile_api_transport.project_default_lun_block_size_set(value,resource[:pool_name],resource[:project_name])
  end

  def dedup
    Puppet.info("##Inside provider_project_dedup_get")
    tegile_api_transport.project_dedup_get(resource[:pool_name],resource[:project_name])
  end

  def dedup=(value)
    Puppet.info("##Inside provider_project_dedup_set")
    tegile_api_transport.project_dedup_set(value,resource[:pool_name],resource[:project_name])
  end

  def quota
    Puppet.info("##Inside provider_project_quota_get")
    tegile_api_transport.project_quota_get(resource[:pool_name],resource[:project_name])
  end

  def quota=(value)
    Puppet.info("##Inside provider_project_quota_set")
    tegile_api_transport.project_quota_set(value,resource[:pool_name],resource[:project_name])
  end

  def compressed_log
    Puppet.info("##Inside provider_project_compressed_log_get")
    tegile_api_transport.project_compressed_log_get(resource[:pool_name],resource[:project_name])
  end

  def compressed_log=(value)
    Puppet.info("##Inside provider_project_compressed_log_set")
    tegile_api_transport.project_compressed_log_set(value,resource[:pool_name],resource[:project_name])
  end

  def compression_type
    Puppet.info("##Inside provider_project_compression_type_get")
    tegile_api_transport.project_compression_type_get(resource[:pool_name],resource[:project_name])
  end

  def compression_type=(value)
    Puppet.info("##Inside provider_project_compression_type_set")
    tegile_api_transport.project_compression_type_set(value,resource[:pool_name],resource[:project_name])
  end

  def intended_protocol_list
    Puppet.info("##Inside provider_project_intended_protocol_list_get")
    tegile_api_transport.project_intended_protocol_list_get(resource[:pool_name],resource[:project_name])
  end

  def intended_protocol_list=(value)
    Puppet.info("##Inside provider_project_intended_protocol_list_set")
    tegile_api_transport.project_intended_protocol_list_set(value,resource[:pool_name],resource[:project_name])
  end

  def lun_mappings
    Puppet.info("##Inside provider_project_lun_mapping_get")
    ##Get current state of project mappings via api and then convert to sorted std_array
    result = tegile_api_transport.project_lun_mapping_get(resource[:pool_name],resource[:project_name])
    result_std_array = RubyMethods.it_view_v21_to_array(result)
    result_std_array_sort1 = result_std_array.sort {|a,b| a[0] <=> b[0]}
    result_std_array_sort2 = result_std_array_sort1.sort {|a,b| a[1] <=> b[1]}
  end

  def lun_mappings=(should)
    Puppet.info("##Inside provider_project_lun_mapping_set")
    ##Get current state of project mappings via api, convert to sorted std_array. This mimics the "lun_mapping" method, unsure if "is" value can be called from here
    is = tegile_api_transport.project_lun_mapping_get(resource[:pool_name],resource[:project_name])
    is_array = RubyMethods.it_view_v21_to_array(is)
    is_array_sort1 = is_array.sort {|a,b| a[0] <=> b[0]}
    is_array_sort2 = is_array_sort1.sort {|a,b| a[1] <=> b[1]}

    ##Sort the should value passed into method
    should_sort1 = should.sort {|a,b| a[0] <=> b[0]}
    should_sort2 = should_sort1.sort {|a,b| a[1] <=> b[1]}

    ##Create filterd variables to add/remove
    should_unique = should_sort2 - is_array_sort2
    is_unique = is_array_sort2 - should_sort2
    ##Use the filtered variables to add missing and remove extra
    if should_unique.length != 0
      should_unique.each do |sub_array|
        tegile_api_transport.project_lun_mapping_set_add(resource[:pool_name],resource[:project_name],sub_array)
      end
    end
    if is_unique.length != 0
      is_unique.each do |sub_array|
        tegile_api_transport.project_lun_mapping_set_delete(resource[:pool_name],resource[:project_name],sub_array)
      end
    end

    # should_unique = value - is
    # is_unique = is - value
    # if should_unique.length != 0
    #   should_unique.each do |sub_array|
    #     tegile_api_transport.project_lun_mapping_set_add(resource[:pool_name],resource[:project_name],sub_array[0],sub_array[1],sub_array[3])
    #   end
    # elsif is_unique.length != 0
    #   is_unique.each do |sub_array|
    #     tegile_api_transport.project_lun_mapping_set_delete(resource[:pool_name],resource[:project_name],sub_array[0],sub_array[1])  
    #   end
    # else
    #   puts "nothing to change"
    # end
  end

  def nfs_network_acls
    Puppet.info("##Inside provider_project_nfs_network_acls_get")
    ##Get current state of project acls via api and then convert to sorted std_array
    result = tegile_api_transport.project_nfs_network_acls_get(resource[:pool_name],resource[:project_name])
    result_std_array = RubyMethods.network_acl_v21_to_array(result)
    result_std_array_sort1 = result_std_array.sort {|a,b| a[0] <=> b[0]}
    result_std_array_sort2 = result_std_array_sort1.sort {|a,b| a[1] <=> b[1]}
  end

  def nfs_network_acls=(should)
    Puppet.info("##Inside provider_project_nfs_network_acls_set")
    ##Get current state of project acls via api, convert to sorted std_array. This mimics the "nfs_network_acls" method, unsure if "is" value can be called from here
    is = tegile_api_transport.project_nfs_network_acls_get(resource[:pool_name],resource[:project_name])
    is_array = RubyMethods.network_acl_v21_to_array(is)
    is_array_sort1 = is_array.sort {|a,b| a[0] <=> b[0]}
    is_array_sort2 = is_array_sort1.sort {|a,b| a[1] <=> b[1]}
    ##Sort the should value passed into method
    should_sort1 = should.sort {|a,b| a[0] <=> b[0]}
    should_sort2 = should_sort1.sort {|a,b| a[1] <=> b[1]}
    ##Create filterd variables to add/remove
    should_unique = should_sort2 - is_array_sort2
    is_unique = is_array_sort2 - should_sort2
    ##Use the filtered variables to add missing and remove extra
    if should_unique.length != 0
      should_unique.each do |sub_array|
        tegile_api_transport.project_nfs_network_acls_set_add(resource[:pool_name],resource[:project_name],sub_array)
      end
    end
    if is_unique.length != 0
      is_unique.each do |sub_array|
        tegile_api_transport.project_nfs_network_acls_set_delete(resource[:pool_name],resource[:project_name],sub_array)
      end
    end
  end




end
