Puppet::Type.newtype(:initiator) do
  @doc = "Type for create/delete initiator"
  Puppet.info("##Inside type_root_initiator")

  apply_to_device
  ensurable

  # autorequire(:initiator_group) do
  #     self[:initiator_group_name]
  # end

  newparam(:initiator_name) do
    isnamevar
    Puppet.info("##Inside type_param_initiator_name")
  end

  newparam(:initiator_group_name) do
    Puppet.info("##Inside type_param_initiator_group_name")
  end

  newparam(:initiator_chap_user_name) do
    Puppet.info("##Inside type_param_initiator_chap_user_name")
  end

  newparam(:initiator_chap_secret) do
    Puppet.info("##Inside type_param_initiator_chap_secret")
  end

 end
