Puppet::Type.newtype(:share) do
  @doc = "Type for create/delete share"
  Puppet.info("##Inside type_root_share")

  apply_to_device
  ensurable

  autorequire(:project) do
      self[:project_name]
  end

  newparam(:share_name) do
    isnamevar
    Puppet.info("##Inside type_param_share_name")
  end

  newparam(:pool_name) do
    Puppet.info("##Inside type_param_pool_name")
  end

  newparam(:project_name) do
    Puppet.info("##Inside type_param_project_name")
  end

  newproperty(:block_size) do
    ##4KB,8KB,16KB,32KB,64KB,128KB
    Puppet.info("##Inside type_param_block_size")
    defaultto :"32KB"
  end

  newproperty(:override_project_nfs_network_acls) do
    Puppet.info("##Inside type_property_override_project_nfs_network_acls")
  end

  newproperty(:nfs_network_acls, :array_matching => :all) do
    Puppet.info("##Inside type_property_nfs_network_acls")
    ##custom insync? method to compare unsorted values
    def insync?(is)
      ##Find unique entries
      is_unique = is - should
      should_unique = should - is
      ##Combine variables and check if empty
      diff = is_unique + should_unique
      diff.length == 0 ? true : false
    end
  end

  

 end
