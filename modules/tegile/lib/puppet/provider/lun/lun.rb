require 'puppet/provider/tegile'

Puppet::Type.type(:lun).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for LUN create/delete"
  Puppet.info("##Inside provider_root_lun")

  def create
    Puppet.info("##Inside provider_lun_create")
    tegile_api_transport.lun_create(resource[:lun_name],resource[:pool_name],resource[:project_name],resource[:lun_protocol],resource[:lun_size],resource[:block_size])
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
        if lun_mappings_create.length != 0
          lun_mappings_create.each do |sub_array|
            tegile_api_transport.lun_mappings_create(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
          end
        end
        if lun_mappings_delete.length != 0
          lun_mappings_delete.each do |sub_array|
            tegile_api_transport.lun_mappings_delete(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
          end
        end
      end
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
    ##Get current state of lun mappings via api, convert from class object to array, then sort
    result = tegile_api_transport.lun_lun_mappings_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
    # puts result.inspect
    result_array = RubyMethods.it_view_v21_to_array(result)
    # puts result_class.inspect
##No need to sort if using custom insync? code
    # result_array_sort1 = result_array.sort {|a,b| a[0] <=> b[0]}
    # result_array_sort2 = result_array_sort1.sort {|a,b| a[1] <=> b[1]}
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
    lun_mappings_create = RubyMethods.find_it_view_v21_to_create(should_itview,is)
    lun_mappings_delete = RubyMethods.find_it_view_v21_to_delete(should_itview,is)

    ##Use the resulting variables to create missing and remove extra
    if lun_mappings_create.length != 0
      lun_mappings_create.each do |sub_array|
        tegile_api_transport.lun_mappings_create(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
      end
    end
    if lun_mappings_delete.length != 0
      lun_mappings_delete.each do |sub_array|
        tegile_api_transport.lun_mappings_delete(resource[:pool_name],resource[:project_name],resource[:lun_name],sub_array)
      end
    end
  end



end
