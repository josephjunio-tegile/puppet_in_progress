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
  end

  newparam(:mount_point) do
    Puppet.info("##Inside type_param_mount_point")
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

  newproperty(:dedup) do
    Puppet.info("##Inside type_property_dedup")
  end

  newproperty(:compression) do
    Puppet.info("##Inside type_property_compression")
  end

  newproperty(:primary_cache) do
    Puppet.info("##Inside type_property_primary_cache")
  end

  newproperty(:secondary_cache) do
    Puppet.info("##Inside type_property_primary_cache")
  end

  newproperty(:quota) do
    Puppet.info("##Inside type_property_quota")
    ##Convert input from GB to B
    munge do |value|
      value*1024*1024*1024
    end
  end

  newproperty(:reservation) do
    Puppet.info("##Inside type_property_reservation")
    ##Convert input from GB to B
    munge do |value|
      value*1024*1024*1024
    end
  end

  newproperty(:readonly) do
    Puppet.info("##Inside type_property_readonly")
  end

  newproperty(:logbias) do
    Puppet.info("##Inside type_property_logbias")
  end

  newproperty(:acl_inherit) do
    Puppet.info("##Inside type_property_acl_inherit")
  end

  newproperty(:share_protocol) do
    Puppet.info("##Inside type_property_share_protocol")
    ## Upcase so that we can compare
    munge do |value|
      upcase = value.upcase
      return upcase
    end
  end

 end
