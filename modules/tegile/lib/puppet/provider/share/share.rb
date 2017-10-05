require 'puppet/provider/tegile'

Puppet::Type.type(:share).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for share create/delete"
  Puppet.info("##Inside provider_root_share")

  def create
    Puppet.info("##Inside provider_share_create")
    tegile_api_transport.share_create(resource[:pool_name],resource[:project_name],resource[:share_name],resource[:block_size])
  end

  def destroy
    Puppet.info("##Inside provider_share_destroy")
    tegile_api_transport.share_delete(resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def exists?
    Puppet.info("##Inside provider_share_exists")
    tegile_api_transport.share_exists(resource[:share_name],resource[:pool_name],resource[:project_name])
  end

  def override_project_nfs_network_acls
    Puppet.info("##Inside provider_share_override_project_network_acls_get")
    tegile_api_transport.share_acl_inherit_get(resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def override_project_nfs_network_acls=(value)
    Puppet.info("##Inside provider_share_override_project_network_acls_set")
    puts "should be #{value}"
    tegile_api_transport.share_acl_inherit_set(resource[:pool_name],resource[:project_name],resource[:share_name])
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
    if should_unique.length != 0
      should_unique.each do |sub_array|
        tegile_api_transport.share_nfs_network_acls_set_add(resource[:pool_name],resource[:project_name],resource[:share_name],sub_array)
      end
    end
    if is_unique.length != 0
      is_unique.each do |sub_array|
        tegile_api_transport.share_nfs_network_acls_set_delete(resource[:pool_name],resource[:project_name],resource[:share_name],sub_array)
      end
    end
  end

end
