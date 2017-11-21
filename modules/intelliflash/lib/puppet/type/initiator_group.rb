Puppet::Type.newtype(:initiator_group) do
  @doc = "Type for create/delete initiator group"
  Puppet.info("##Inside type_root_initiator_group")

  apply_to_device
  ensurable

  # autorequire(:initiator) do
    
  # end

  newparam(:initiator_group_name) do
    isnamevar
    Puppet.info("##Inside type_param_initiator_group_name")
  end

  newproperty(:members, :array_matching => :all) do
    Puppet.info("##Inside type_param_initiator_group_members")
  end

 end
