require 'puppet/provider/tegile'

Puppet::Type.type(:lun).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for LUN create/delete"
  Puppet.info("##Inside provider_root_lun")

  def create
    Puppet.info("##Inside provider_lun_create")
    tegile_api_transport.lun_create(resource[:lun_name],resource[:pool_name],resource[:project_name],resource[:lun_protocol],resource[:lun_size],resource[:block_size])
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
    ##If override project is enabled then we will use api to set back to inherit
    ##No change needed if override is set to yes, the "lun_mappings=" method will over ride when used
    if should == "no"
      tegile_api_transport.lun_override_project_mappings_set(resource[:pool_name],resource[:project_name],resource[:lun_name])
    end
    if should == "yes"
      puts "lun_mappings will be allowed"
    end
  end

  def lun_mappings
    Puppet.info("##Inside provider_lun_lun_mappings_get")
    ##Get current state of lun mappings via api, convert to array without lun_nbr and read_only, then sort
    result = tegile_api_transport.lun_lun_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts result.inspect
    result_trimmed_std_array = RubyMethods.it_view_v21_to_array_nolun_noreadonly(result)
    puts result_trimmed_std_array.inspect
    result_std_array_sort1 = result_std_array.sort {|a,b| a[0] <=> b[0]}
    result_std_array_sort2 = result_std_array_sort1.sort {|a,b| a[1] <=> b[1]}
  end

  def lun_mappings=(should)
    Puppet.info("##Inside provider_lun_lun_mappings_set")
    ##Check to make sure the "override_project_mappings" type is set to yes before continuing
    if resource[:override_project_mappings] == "no"
      fail "override_project_mappings must be set to yes before network acls can bet configured"
    end
    ##Get current state of lun mappings via api, convert to array without lun_nbr and read_only, then sort. This mimics the "lun_mappings" method, unsure if "is" value can be called from here
    is = tegile_api_transport.lun_lun_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    is_array = RubyMethods.it_view_v21_to_array_nolun_noreadonly(result)
    is_array_sort1 = is_array.sort {|a,b| a[0] <=> b[0]}
    is_array_sort2 = is_array_sort1.sort {|a,b| a[1] <=> b[1]}
    ##Sort the should value passed into method
    should_sort1 = should.sort {|a,b| a[0] <=> b[0]}
    should_sort2 = should_sort1.sort {|a,b| a[1] <=> b[1]}
    ##Create filterd variables to add/remove
    should_unique = should_sort2 - is_array_sort2
    is_unique = is_array_sort2 - should_sort2
    puts "uniques"
    puts should_unique.inspect
    puts is_unique.inspect
    ##Use the filtered variables to add missing and remove extra
    if should_unique.length != 0
      should_unique.each do |sub_array|
        tegile_api_transport.lun_lun_mappings_set_add(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
      end
    end
    if is_unique.length != 0
      is_unique.each do |sub_array|
        tegile_api_transport.lun_lun_mappings_set_delete(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
      end
    end
  end



end
