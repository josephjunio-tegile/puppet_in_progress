Puppet::Type.newtype(:project_nfs_network_acl) do

  @doc = "Type for create/delete project_nfs_network_acl"

  Puppet.info("##Inside type_root_project_nfs_network_acl")

  apply_to_all
  ensurable

  autorequire(:project) do
      self[:project_name]
  end

  newparam(:project_name) do
    #desc "The name of the host. "
    isnamevar
    Puppet.info("##Inside type_param_project_name")
  end

  newparam(:pool_name) do
    Puppet.info("##Inside type_param_pool_name")
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
