require 'puppet/provider/tegile'

Puppet::Type.type(:project).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for project create/delete"
  Puppet.info("##Inside provider_root_project")

  def create
    Puppet.info("##Inside provider_project_create")
    tegile_api_transport.project_create(resource[:project_name],resource[:pool_name],resource[:compression_class],resource[:compression_type],resource[:compressed_log],resource[:intended_protocol_list],resource[:quota],resource[:dedup],resource[:primary_cache],resource[:secondary_cache],resource[:acl_inherit],resource[:default_lun_size],resource[:default_lun_block_size],resource[:default_thin_provisioning],resource[:default_share_block_size])
    if resource[:intended_protocol_list] != nil
      enabled_protocols = resource[:intended_protocol_list]
      if enabled_protocols.include?("NFS")
        puts "enabling nfs"
        tegile_api_transport.set_nfs_sharing_on(resource[:project_name],resource[:pool_name])
      end
      if enabled_protocols.include?("SMB")
        puts "enabling smb"
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
    tegile_api_transport.project_delete(resource[:project_name],resource[:pool_name])
  end

  def exists?
    Puppet.info("##Inside provider_project_exists")
    tegile_api_transport.project_exists(resource[:project_name],resource[:pool_name])
  end

  def default_share_block_size
    Puppet.info("##Inside provider_project_default_share_block_size_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.record_size.inspect
    returned.record_size.value
  end

  def default_share_block_size=(should)
    Puppet.info("##Inside provider_project_default_share_block_size_set")
    tegile_api_transport.project_set("record_size",should,resource[:pool_name],resource[:project_name])
  end

  def default_thin_provisioning
    Puppet.info("##Inside provider_project_default_thin_provisioning_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.default_thin_provisioning
    returned.default_thin_provisioning
  end

  def default_thin_provisioning=(should)
    Puppet.info("##Inside provider_project_default_thin_provisioning_set")
    tegile_api_transport.project_set("default_thin_provisioning",should,resource[:pool_name],resource[:project_name])
  end

  def default_lun_size
    Puppet.info("##Inside provider_project_default_lun_size_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.default_volume_size_in_byte
    returned.default_volume_size_in_byte
  end
  
  def default_lun_size=(should)
    Puppet.info("##Inside provider_project_default_lun_size_set")
    tegile_api_transport.project_set("default_volume_size_in_byte",should,resource[:pool_name],resource[:project_name])
  end

  def default_lun_block_size
    Puppet.info("##Inside provider_project_default_lun_block_size_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.default_volume_block_size.inspect
    returned.default_volume_block_size.value
  end

  def default_lun_block_size=(should)
    Puppet.info("##Inside provider_project_default_lun_block_size_set")
    tegile_api_transport.project_set("default_volume_block_size",should,resource[:pool_name],resource[:project_name])
  end

  def primary_cache
    Puppet.info("##Inside provider_project_primary_cache_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.primary_cache
    returned.primary_cache
  end

  def primary_cache=(should)
    Puppet.info("##Inside provider_project_primary_cache_set")
    tegile_api_transport.project_set("primary_cache",should,resource[:pool_name],resource[:project_name])
  end

  def secondary_cache
    Puppet.info("##Inside provider_project_secondary_cache_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.secondary_cache
    returned.secondary_cache
  end

  def secondary_cache=(should)
    Puppet.info("##Inside provider_project_secondary_cache_set")
    tegile_api_transport.project_set("secondary_cache",should,resource[:pool_name],resource[:project_name])
  end

  def acl_inherit
    Puppet.info("##Inside provider_project_acl_inherit_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.acl_inherit
    returned.acl_inherit
  end

  def acl_inherit=(should)
    Puppet.info("##Inside provider_project_acl_inherit_set")
    tegile_api_transport.project_set("acl_inherit",should,resource[:pool_name],resource[:project_name])
  end

  def readonly
    Puppet.info("##Inside provider_project_readonly_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.readonly
    returned.readonly
  end

  def readonly=(should)
    Puppet.info("##Inside provider_project_readonly_set")
    tegile_api_transport.project_set("readonly",should,resource[:pool_name],resource[:project_name])
  end

  def dedup
    Puppet.info("##Inside provider_project_dedup_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.dedup
    returned.dedup
  end

  def dedup=(should)
    Puppet.info("##Inside provider_project_dedup_set")
    tegile_api_transport.project_set("dedup",should,resource[:pool_name],resource[:project_name])
  end

  def quota
    Puppet.info("##Inside provider_project_quota_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.quota_in_byte
    returned.quota_in_byte
  end

  def quota=(should)
    Puppet.info("##Inside provider_project_quota_set")
    tegile_api_transport.project_set("quota",should,resource[:pool_name],resource[:project_name])
  end

  def compressed_log
    Puppet.info("##Inside provider_project_compressed_log_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.compressed_log
    returned.compressed_log
  end

  def compressed_log=(should)
    Puppet.info("##Inside provider_project_compressed_log_set")
    tegile_api_transport.project_set("compressed_log",should,resource[:pool_name],resource[:project_name])
  end

  def compression_type
    Puppet.info("##Inside provider_project_compression_type_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.compression
    returned.compression
  end

  def compression_type=(should)
    Puppet.info("##Inside provider_project_compression_type_set")
    tegile_api_transport.project_set("compression_type",should,resource[:pool_name],resource[:project_name])
  end

  def compression_class
    Puppet.info("##Inside provider_project_compression_class_get")
    returned = tegile_api_transport.project_get(resource[:pool_name],resource[:project_name])
    # puts returned.compression_class.inspect
    returned.compression_class.value
  end

  def compression_class=(should)
    Puppet.info("##Inside provider_project_compression_class_set")
    tegile_api_transport.project_set("compression_class",should,resource[:pool_name],resource[:project_name])
  end

  def intended_protocol_list
    Puppet.info("##Inside provider_project_intended_protocol_list_get")
    # tegile_api_transport.project_intended_protocol_list_get(resource[:pool_name],resource[:project_name])
    is = resource[:intended_protocol_list]
    if is.include?("NFS")
      if tegile_api_transport.project_exposed_over_nfs(resource[:pool_name],resource[:project_name]) != true
        is.delete("NFS")
      end
    end
    if is.include?("SMB")
      if tegile_api_transport.project_exposed_over_smb(resource[:pool_name],resource[:project_name]) != true
        is.delete("SMB")
      end
    end
    # puts is.inspect
    return is
  end

  def intended_protocol_list=(should)
    Puppet.info("##Inside provider_project_intended_protocol_list_set")
    if should.include?("NFS")
      if tegile_api_transport.project_exposed_over_nfs(resource[:pool_name],resource[:project_name]) != true
        tegile_api_transport.set_nfs_sharing_on(resource[:project_name],resource[:pool_name])
      end
    end
    if should.include?("SMB")
      if tegile_api_transport.project_exposed_over_smb(resource[:pool_name],resource[:project_name]) != true
        tegile_api_transport.project_set_smb_sharing_on(resource[:project_name],resource[:pool_name])
      end
    end
    # puts should.inspect
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
    if is_unique.length != 0
      is_unique.each do |sub_array|
        tegile_api_transport.project_nfs_network_acls_set_delete(resource[:pool_name],resource[:project_name],sub_array)
      end
    end
    if should_unique.length != 0
      should_unique.each do |sub_array|
        tegile_api_transport.project_nfs_network_acls_set_add(resource[:pool_name],resource[:project_name],sub_array)
      end
    end
  end




end
