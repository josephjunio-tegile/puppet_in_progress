Puppet::Type.newtype(:share_nfs_network_acl) do
  @doc = "Type for create/delete share_nfs_network_acl"
  Puppet.info("##Inside type_root_share_nfs_network_acl")

  apply_to_device
  ensurable

  autorequire(:share) do
      self[:share_name]
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

  newparam(:acl_type) do
    Puppet.info("##Inside type_param_acl_type")
  end

  newparam(:acl_host) do
    Puppet.info("##Inside type_param_acl_host")
  end

  newparam(:access_mode) do
    Puppet.info("##Inside type_param_access_mode")
  end

 end
