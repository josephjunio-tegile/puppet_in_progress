Puppet::Type.newtype(:project_mapping) do
  Puppet.info("##Inside type_root_project_mapping")
  
  apply_to_all
  ensurable
  
  autorequire(:project) do
    self[:project_name]
  end

  autorequire(:initiator_group) do
    self[:initiator_group_name]
  end

  autorequire(:iscsi_target_group) do
    self[:target_group_name]
  end
  
  newparam(:project_name) do
    isnamevar
    Puppet.info("##Inside type_param_project_name")
  end
  
  newparam(:pool_name) do
    Puppet.info("##Inside type_param_pool_name")
  end
  
  newparam(:initiator_group_name) do
    Puppet.info("##Inside type_param_initiator_group_name")
  end
  
  newparam(:target_group_name) do
    Puppet.info("##Inside type_param_target_group_name")
  end

end
