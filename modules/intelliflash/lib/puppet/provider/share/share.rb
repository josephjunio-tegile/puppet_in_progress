require 'puppet/provider/tegile'

Puppet::Type.type(:share).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for share create/delete"
  Puppet.info("##Inside provider_root_share")

  def create
    Puppet.info("##Inside provider_share_create")
    tegile_api_transport.share_create(resource[:pool_name],resource[:project_name],resource[:share_name],resource[:block_size],resource[:mount_point])
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
    tegile_api_transport.share_block_size_get(resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def block_size=(should)
    Puppet.info("##Inside provider_share_block_size_set")
    tegile_api_transport.share_block_size_set(should,resource[:pool_name],resource[:project_name],resource[:share_name])
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
    # puts returned.dedup
    returned.dedup
  end

  def dedup=(should)
    Puppet.info("##Inside provider_share_dedup_set")
    tegile_api_transport.share_set("dedup",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def compression
    Puppet.info("##Inside provider_share_compression_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.compression
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
    # puts returned.reservation_in_byte
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
    returned.readonly
  end

  def readonly=(should)
    Puppet.info("##Inside provider_share_readonly_set")
    tegile_api_transport.share_set("readonly",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def logbias
    Puppet.info("##Inside provider_share_logbias_get")
    returned = tegile_api_transport.share_get(resource[:pool_name],resource[:project_name],resource[:share_name])
    # puts returned.logbias
    returned.logbias
  end

  def logbias=(should)
    Puppet.info("##Inside provider_share_logbias_set")
    tegile_api_transport.share_set("logbias",should,resource[:pool_name],resource[:project_name],resource[:share_name])
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
    returned.acl_inherit
  end

  def acl_inherit=(should)
    Puppet.info("##Inside provider_share_acl_inherit_set")
    tegile_api_transport.share_set("acl_inherit",should,resource[:pool_name],resource[:project_name],resource[:share_name])
  end




end
