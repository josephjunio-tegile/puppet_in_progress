Puppet::Type.newtype(:lun_mapping) do
  @doc = "Type for create/delete lun mappings"
  Puppet.info("##Inside type_root_lun_mapping")

  apply_to_device
  ensurable

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

  newparam(:lun_name) do
    Puppet.info("##Inside type_param_lun_name")
  end

end
