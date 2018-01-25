require 'puppet/provider/tegile'

Puppet::Type.type(:lun).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for LUN create/delete"
  Puppet.info("##Inside provider_root_lun")

  def create
    Puppet.info("##Inside provider_lun_create")
    tegile_api_transport.lun_create(resource[:lun_name],resource[:pool_name],resource[:project_name],resource[:lun_protocol],resource[:lun_size],resource[:block_size],resource[:thin_provision])
    if resource[:lun_mappings] != nil
      if resource[:override_project_mappings] == "no" or resource[:override_project_mappings] == nil
        fail "override_project_mappings must be set to yes before network acls can bet configured"
      elsif resource[:override_project_mappings] == "yes"
        ##Get current state of lun mappings via api. This mimics the "lun_mappings" method without needing to convert it to an array or sorting, unsure if "is" value can be called from here
        is = tegile_api_transport.lun_lun_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
        should_itview = RubyMethods.array_of_arrays_to_it_view_v21(resource[:lun_mappings])
        ##Use custom compare methods for should/is values to get create/delete
        lun_mappings_create = RubyMethods.find_it_view_v21_to_create(should_itview,is)
        lun_mappings_delete = RubyMethods.find_it_view_v21_to_delete(should_itview,is)
        ##Use the resulting variables to create missing and remove extra
        if lun_mappings_delete.length != 0
          lun_mappings_delete.each do |sub_array|
            tegile_api_transport.lun_mappings_delete(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
          end
        end
        if lun_mappings_create.length != 0
          lun_mappings_create.each do |sub_array|
            tegile_api_transport.lun_mappings_create(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
          end
        end
      end
    end
    if resource[:compression] != nil
      tegile_api_transport.lun_set("compression",resource[:compression],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if resource[:compressed_log] != nil
      tegile_api_transport.lun_set("compressed_log",resource[:compression],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if resource[:dedup] != nil
      tegile_api_transport.lun_set("dedup",resource[:dedup],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if resource[:primary_cache] != nil
      tegile_api_transport.lun_set("primary_cache",resource[:primary_cache],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if resource[:secondary_cache] != nil
      tegile_api_transport.lun_set("secondary_cache",resource[:secondary_cache],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if resource[:readonly] != nil
      tegile_api_transport.lun_set("readonly",resource[:readonly],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if resource[:logbias] != nil
      tegile_api_transport.lun_set("logbias",resource[:logbias],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if resource[:write_back_cache] != nil
      tegile_api_transport.lun_set("write_back_cache",resource[:logbias],resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
  end

  def destroy
    Puppet.info("##Inside provider_lun_destroy")
    tegile_api_transport.lun_delete(resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def exists?
    Puppet.info("##Inside provider_lun_exists")
    tegile_api_transport.lun_exists(resource[:lun_name],resource[:pool_name],resource[:project_name])
  end

  def override_project_mappings
    Puppet.info("##Inside provider_lun_override_project_mappings_get")
    ##Use api to get status of lun override_views property, then convert to yes/no before returning
    ##Using the default true/false was causing the insync? method to behave unexpectedly
    result = tegile_api_transport.lun_override_project_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    result == true ? "yes" : "no"
  end

  def override_project_mappings=(should)
    Puppet.info("##Inside provider_lun_override_project_mappings_set")
    ##If override is no use api to set back to inherit
    ##If override is yes use api to get existing mappings and remove. currently when api removes mappings the override value is not set
    if should == "no"
      tegile_api_transport.lun_override_project_mappings_set(resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if should == "yes"
      puts "removing any inherited mappings and permitting explicit mappings"
      is = tegile_api_transport.lun_lun_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
      if is.length != 0
        is.each do |sub_array|
          tegile_api_transport.lun_mappings_delete(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
        end
      end
    end
  end

  def lun_mappings
    Puppet.info("##Inside provider_lun_lun_mappings_get")
    ##Get current state of lun mappings via api, convert from class object to array, then sort
    result = tegile_api_transport.lun_lun_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts result.inspect
    result_array = RubyMethods.it_view_v21_to_array(result)
    # puts "should:#{resource[:lun_mappings].inspect}"
    # puts "is:#{result_array.inspect}"
    return result_array
  end

  def lun_mappings=(should)
    Puppet.info("##Inside provider_lun_lun_mappings_set")
    ##Check to make sure the "override_project_mappings" type is set to yes before continuing
    if resource[:override_project_mappings] == "no"
      fail "override_project_mappings must be set to yes before network acls can bet configured"
    end
    ##Get current state of lun mappings via api. This mimics the "lun_mappings" method without needing to convert it to an array or sorting, unsure if "is" value can be called from here
    is = tegile_api_transport.lun_lun_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    should_itview = RubyMethods.array_of_arrays_to_it_view_v21(should)

    ##Use custom compare methods for should/is values to get create/delete
    ##If lun_num is not -1 then compares full mapping value
    lun_mappings_delete = RubyMethods.find_it_view_v21_to_delete_lun(should_itview,is)
    lun_mappings_create = RubyMethods.find_it_view_v21_to_create_lun(should_itview,is)

    ##Use the resulting variables to create missing and remove extra
    if lun_mappings_delete.length != 0
      lun_mappings_delete.each do |sub_array|
        tegile_api_transport.lun_mappings_delete(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
      end
    end
    if lun_mappings_create.length != 0
      lun_mappings_create.each do |sub_array|
        tegile_api_transport.lun_mappings_create(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
      end
    end
  end

  def compression
    Puppet.info("##Inside provider_lun_compression_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    puts returned.compression
    returned.compression
  end

  def compression=(should)
    Puppet.info("##Inside provider_lun_compression_set")
    tegile_api_transport.lun_set("compression",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def compressed_log
    Puppet.info("##Inside provider_lun_compressed_log_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    puts returned.compressed_log
    returned.compressed_log
  end

  def compressed_log=(should)
    Puppet.info("##Inside provider_lun_compressed_log_set")
    tegile_api_transport.lun_set("compressed_log",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def dedup
    Puppet.info("##Inside provider_lun_dedup_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts returned.dedup
    returned.dedup
  end

  def dedup=(should)
    Puppet.info("##Inside provider_lun_dedup_set")
    tegile_api_transport.lun_set("dedup",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def primary_cache
    Puppet.info("##Inside provider_lun_primary_cache_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts returned.primary_cache
    returned.primary_cache
  end

  def primary_cache=(should)
    Puppet.info("##Inside provider_lun_primary_cache_set")
    tegile_api_transport.lun_set("primary_cache",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def secondary_cache
    Puppet.info("##Inside provider_lun_secondary_cache_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts returned.secondary_cache
    returned.secondary_cache
  end

  def secondary_cache=(should)
    Puppet.info("##Inside provider_lun_secondary_cache_set")
    tegile_api_transport.lun_set("secondary_cache",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def readonly
    Puppet.info("##Inside provider_lun_readonly_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts returned.readonly
    returned.readonly
  end

  def readonly=(should)
    Puppet.info("##Inside provider_lun_readonly_set")
    tegile_api_transport.lun_set("readonly",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def logbias
    Puppet.info("##Inside provider_lun_logbias_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts returned.logbias
    returned.logbias
  end

  def logbias=(should)
    Puppet.info("##Inside provider_lun_logbias_set")
    tegile_api_transport.lun_set("logbias",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def write_back_cache
    Puppet.info("##Inside provider_lun_write_back_cache_get")
    returned = tegile_api_transport.lun_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts returned.write_back_cache
    returned.write_back_cache
  end

  def write_back_cache=(should)
    Puppet.info("##Inside provider_lun_write_back_cache_set")
    tegile_api_transport.lun_set("write_back_cache",should,resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

end
