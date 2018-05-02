require 'puppet/provider/tegile'

Puppet::Type.type(:share).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for share create/delete"
  Puppet.info("##Inside provider_root_share")

  def create
    Puppet.info("##Inside provider_share_create")
    tegile_api_transport.share_create(resource[:pool_name],resource[:project_name],resource[:share_name],resource[:mount_point])#,resource[:block_size]
    ##check if nfs_network_acls are present and sync them up
    if resource[:nfs_network_acls] != nil
      if resource[:override_project_nfs_network_acls] == "no" or resource[:override_project_nfs_network_acls] == nil
        fail "override_project_nfs_network_acls must be set to yes before network acls can bet configured"
      elsif resource[:override_project_nfs_network_acls] == "yes"
        ##Get current state of share acls via api, convert to sorted std_array. This mimics the "nfs_network_acls" method, unsure if "is" value can be called from here
        is = tegile_api_transport.share_nfs_network_acls_get(resource[:pool_name],resource[:project_name],resource[:share_name])
        is_array = RubyMethods.network_acl_v21_to_array(is)
        is_array_sort1 = is_array.sort {|a,b| a[0] <=> b[0]}
        is_array_sort2 = is_array_sort1.sort {|a,b| a[1] <=> b[1]}
        ##Sort the should value passed into method
        should_sort1 = resource[:nfs_network_acls].sort {|a,b| a[0] <=> b[0]}
        should_sort2 = should_sort1.sort {|a,b| a[1] <=> b[1]}
        ##Create filterd variables to add/remove
        should_unique = should_sort2 - is_array_sort2
        is_unique = is_array_sort2 - should_sort2
        ##Use the filtered variables to add missing and remove extra
        if is_unique.length != 0
          is_unique.each do |sub_array|
            tegile_api_transport.share_nfs_network_acls_set_delete(resource[:pool_name],resource[:project_name],resource[:share_name],sub_array)
          end
        end
        if should_unique.length != 0
          should_unique.each do |sub_array|
            tegile_api_transport.share_nfs_network_acls_set_add(resource[:pool_name],resource[:project_name],resource[:share_name],sub_array)
          end
        end
      end
    end
    if resource[:dedup] != nil
      tegile_api_transport.share_set("dedup",resource[:dedup],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:compression] != nil
      tegile_api_transport.share_set("compression",resource[:compression],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:primary_cache] != nil
      tegile_api_transport.share_set("primary_cache",resource[:primary_cache],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:secondary_cache] != nil
      tegile_api_transport.share_set("secondary_cache",resource[:secondary_cache],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:quota] != nil
      tegile_api_transport.share_set("quota_in_byte",resource[:quota],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:reservation] != nil
      tegile_api_transport.share_set("reservation_in_byte",resource[:reservation],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:readonly] != nil
      tegile_api_transport.share_set("readonly",resource[:readonly],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:logbias] != nil
      tegile_api_transport.share_set("logbias",resource[:logbias],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:acl_inherit] != nil
      tegile_api_transport.share_set("acl_inherit",resource[:acl_inherit],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:block_size] != nil
      tegile_api_transport.share_set("block_size",resource[:block_size],resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if resource[:read_cache] != nil
      if resource[:read_cache] == "on"
        tegile_api_transport.share_set("primary_cache","all",resource[:pool_name],resource[:project_name],resource[:share_name])
        tegile_api_transport.share_set("secondary_cache","all",resource[:pool_name],resource[:project_name],resource[:share_name])
      elsif resource[:read_cache] == "off"
        tegile_api_transport.share_set("primary_cache","metadata",resource[:pool_name],resource[:project_name],resource[:share_name])
        tegile_api_transport.share_set("secondary_cache","metadata",resource[:pool_name],resource[:project_name],resource[:share_name])
      else
        fail "invalid read_cache value"
      end
    end
  end

  def destroy
    Puppet.info("##Inside provider_share_destroy")
    tegile_api_transport.share_delete(resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def exists?
    Puppet.info("##Inside provider_share_exists")
    tegile_api_transport.share_exists(resource[:share_name],resource[:pool_name],resource[:project_name])
  end

  def block_size
    Puppet.info("##Inside provider_share_block_size_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.record_size.value
    returned.record_size.value
  end

  def block_size=(should)
    Puppet.info("##Inside provider_share_block_size_set")
    tegile_api_transport.share_set("block_size",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def override_project_nfs_network_acls
    Puppet.info("##Inside provider_share_override_project_network_acls_get")
    ##Use api to get status of share override_sharenfs property, then convert to yes/no before returning
    ##Using default true/false was causing the insync? method to behave unexpectedly
    result = tegile_api_transport.share_acl_inherit_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    result == true ? "yes" : "no"
  end

  def override_project_nfs_network_acls=(should)
    Puppet.info("##Inside provider_share_override_project_network_acls_set")
    ##If override is set to "no" api is used to set back to inherit
    ##If override is set to "yes" api is used to retrieve them, convert to array, and remove them. api to remove will set share override value to true
    if should == "no"
      tegile_api_transport.share_acl_inherit_set(resource[:pool_name],resource[:project_name],resource[:share_name])
    end
    if should == "yes"
      puts "removing any inherited network acls and permitting explicit mappings"
      is = tegile_api_transport.share_nfs_network_acls_get(resource[:pool_name],resource[:project_name],resource[:share_name])
      # puts is.inspect
      is_array = RubyMethods.network_acl_v21_to_array(is)
      if is_array.length != 0
        is_array.each do |sub_array|
          tegile_api_transport.share_nfs_network_acls_set_delete(resource[:pool_name],resource[:project_name],resource[:share_name],sub_array)
        end
      end
    end
  end

  def nfs_network_acls
    Puppet.info("##Inside provider_share_nfs_network_acls_get")
    ##Get current state of share acls via api and then convert to sorted std_array
    result = tegile_api_transport.share_nfs_network_acls_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    result_std_array = RubyMethods.network_acl_v21_to_array(result)
    result_std_array_sort1 = result_std_array.sort {|a,b| a[0] <=> b[0]}
    result_std_array_sort2 = result_std_array_sort1.sort {|a,b| a[1] <=> b[1]}
  end

  def nfs_network_acls=(should)
    Puppet.info("##Inside provider_share_nfs_network_acls_set")
    ##Check to make sure the "override_project_nfs_network_acls" type is set to yes before continuing
    if resource[:override_project_nfs_network_acls] == "no"
      fail "override_project_nfs_network_acls must be set to yes before network acls can be configured"
    end
    if resource[:override_project_nfs_network_acls] == nil
      fail "override_project_nfs_network_acls must be set to yes before network acls can bet configured"
    end
    ##Get current state of share acls via api, convert to sorted std_array. This mimics the "nfs_network_acls" method, unsure if "is" value can be called from here
    is = tegile_api_transport.share_nfs_network_acls_get(resource[:pool_name],resource[:project_name],resource[:share_name])
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
        tegile_api_transport.share_nfs_network_acls_set_delete(resource[:pool_name],resource[:project_name],resource[:share_name],sub_array)
      end
    end
    if should_unique.length != 0
      should_unique.each do |sub_array|
        tegile_api_transport.share_nfs_network_acls_set_add(resource[:pool_name],resource[:project_name],resource[:share_name],sub_array)
      end
    end
  end

  def dedup
    Puppet.info("##Inside provider_share_dedup_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    if resource[:dedup] == "inherit"
      if returned.override_dedup == false
        return "inherit"
      else
        return returned.dedup
      end
    else
      return returned.dedup
    end
    # puts returned.dedup
  end

  def dedup=(should)
    Puppet.info("##Inside provider_share_dedup_set")
    if should == "inherit"
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"Dedup")
    else
      tegile_api_transport.share_set("dedup",should,resource[:pool_name],resource[:project_name],resource[:share_name])
    end
  end

  def compression_class
    Puppet.info("##Inside provider_share_compression_class_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.compression_class.inspect
    if resource[:compression_class] == "inherit"
      if returned.override_compression == false
        return "inherit"
      else
        return returned.compression_class.value
      end
    else
      return returned.compression_class.value
    end
  end

  def compression_class=(should)
    Puppet.info("##Inside provider_share_compression_class_set")
    if should == "inherit"
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"Compression")
    else
      tegile_api_transport.share_set("compression_class",should,resource[:pool_name],resource[:project_name],resource[:share_name])
    end
  end

  def compression
    Puppet.info("##Inside provider_share_compression_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    puts returned.compression
    returned.compression
  end

  def compression=(should)
    Puppet.info("##Inside provider_share_compression_set")
    tegile_api_transport.share_set("compression",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def quota
    Puppet.info("##Inside provider_share_quota_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.quota_in_byte
    returned.quota_in_byte
  end

  def quota=(should)
    Puppet.info("##Inside provider_share_quota_set")
    tegile_api_transport.share_set("quota",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def reservation
    Puppet.info("##Inside provider_share_reservation_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    puts returned.reservation_in_byte
    returned.reservation_in_byte
  end

  def reservation=(should)
    Puppet.info("##Inside provider_share_reservation_set")
    tegile_api_transport.share_set("reservation",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def readonly
    Puppet.info("##Inside provider_share_readonly_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.readonly    
    if resource[:readonly] == "inherit"
      if returned.override_readonly == false
        return "inherit"
      else
        return returned.readonly
      end
    else
      return returned.readonly
    end
  end

  def readonly=(should)
    Puppet.info("##Inside provider_share_readonly_set")
    if should == "inherit"
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"Readonly")
    else
      tegile_api_transport.share_set("readonly",should,resource[:pool_name],resource[:project_name],resource[:share_name])
    end
  end

  def logbias
    Puppet.info("##Inside provider_share_logbias_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.logbias
    if resource[:logbias] == "inherit"
      if returned.logbias == false
        return "inherit"
      else
        return returned.logbias
      end
    else
      return returned.logbias
    end
  end

  def logbias=(should)
    Puppet.info("##Inside provider_share_logbias_set")
    if should == "inherit"
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"Logbias")
    else
      tegile_api_transport.share_set("logbias",should,resource[:pool_name],resource[:project_name],resource[:share_name])
    end
  end

  def read_cache
    Puppet.info("##Inside provider_share_read_cache_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    primary_cache_status = returned.primary_cache
    secondary_cache_status = returned.secondary_cache
    if resource[:read_cache] == "inherit"
      if returned.override_primary_cache == false && returned.override_secondary_cache == false
        return "inherit"
      else
        if primary_cache_status == "all" && secondary_cache_status == "all"
          return "on"
        elsif primary_cache_status == "metadata" && secondary_cache_status == "metadata"
          return "off"
        else
          fail "invalid read_cache state"
        end
      end
    else
      if primary_cache_status == "all" && secondary_cache_status == "all"
        return "on"
      elsif primary_cache_status == "metadata" && secondary_cache_status == "metadata"
        return "off"
      else
        fail "invalid read_cache state"
      end
    end
  end

  def read_cache=(should)
    Puppet.info("##Inside provider_share_read_cache_set")
    if should == "inherit"
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"PrimaryCache")
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"SecondaryCache")
    elsif should == "on"
      tegile_api_transport.share_set("primary_cache","all",resource[:pool_name],resource[:project_name],resource[:share_name])
      tegile_api_transport.share_set("secondary_cache","all",resource[:pool_name],resource[:project_name],resource[:share_name])
    elsif 
      should == "off"
      tegile_api_transport.share_set("primary_cache","metadata",resource[:pool_name],resource[:project_name],resource[:share_name])
      tegile_api_transport.share_set("secondary_cache","metadata",resource[:pool_name],resource[:project_name],resource[:share_name])
    else
      fail "invalid read_cache value"
    end
  end

  def primary_cache
    Puppet.info("##Inside provider_share_primary_cache_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.primary_cache
    returned.primary_cache
  end

  def primary_cache=(should)
    Puppet.info("##Inside provider_share_primary_cache_set")
    tegile_api_transport.share_set("primary_cache",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def secondary_cache
    Puppet.info("##Inside provider_share_secondary_cache_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.secondary_cache
    returned.secondary_cache
  end

  def secondary_cache=(should)
    Puppet.info("##Inside provider_share_secondary_cache_set")
    tegile_api_transport.share_set("secondary_cache",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def acl_inherit
    Puppet.info("##Inside provider_share_acl_inherit_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.acl_inherit
    if resource[:acl_inherit] == "inherit"
      if returned.override_acl_inherit == false
        return "inherit"
      else
        return returned.acl_inherit
      end
    else
      return returned.acl_inherit
    end
  end

  def acl_inherit=(should)
    Puppet.info("##Inside provider_share_acl_inherit_set")
    if should == "inherit"
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"AclInherit")
    else
      tegile_api_transport.share_set("acl_inherit",should,resource[:pool_name],resource[:project_name],resource[:share_name])
    end
  end

  def share_protocol
    nfs_on = tegile_api_transport.share_exposed_over_nfs(resource[:pool_name],resource[:project_name],resource[:share_name])
    smb_on = tegile_api_transport.share_exposed_over_smb(resource[:pool_name],resource[:project_name],resource[:share_name])
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    inherited = returned.override_sharenfs && returned.override_sharesmb
    if resource[:share_protocol] == "INHERIT" && inherited == false
      # puts "inherited"
      return "INHERIT"
    else
      if nfs_on && smb_on == true
        # puts "nfs & smb enabled"
        return "SMB+NFS"
      elsif nfs_on == true
        # puts "nfs is enabled"
        return "NFS"
      elsif smb_on == true
        # puts "smb is enabled"
        return "SMB"
      else 
        # puts "no sharing enabled"
        return "NONE"
      end
    end
  end

  def share_protocol=(should)
    if should == "SMB+NFS"
      smb_status = tegile_api_transport.get_smb_config
      if smb_status.smb_protocol_mode == "SMB3"
        fail "SMBv3 enabled, NFS&SMB sharing not supported"
      end
      tegile_api_transport.share_set_smb_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],true)
      tegile_api_transport.share_set_nfs_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],true)
    elsif should == "NFS"
      tegile_api_transport.share_set_nfs_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],true)
      tegile_api_transport.share_set_smb_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],false)
    elsif should == "SMB"
      tegile_api_transport.share_set_smb_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],true)
      tegile_api_transport.share_set_nfs_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],false)
    elsif should == "NONE"
      tegile_api_transport.share_set_nfs_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],false)
      tegile_api_transport.share_set_smb_sharing(resource[:pool_name],resource[:project_name],resource[:share_name],false)
    elsif should == "INHERIT"
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"Sharenfs")
      tegile_api_transport.inherit_property_from_project(resource[:pool_name],resource[:project_name],resource[:share_name],"Sharesmb")
    else
      fail "issue finding share_protocol value to set"
    end
  end




end
