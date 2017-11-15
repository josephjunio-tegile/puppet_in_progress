Puppet::Type.newtype(:iscsi_target_group) do
  @doc = "Type for create/delete iscsi_target_group"
  Puppet.info("##Inside type_root_iscsi_target_group")

  apply_to_device
  ensurable

  newparam(:iscsi_target_group_name) do
    #desc "The name of the host. "
    isnamevar
    Puppet.info("##Inside type_param_iscsi_target_group_name")
  end

  newparam(:pool_name) do
    Puppet.info("##Inside type_param_iscsi_target_group_pool_name")
  end

  newproperty(:members, :array_matching => :all) do
    Puppet.info("##Inside type_param_iscsi_target_group_members")
  end

end
