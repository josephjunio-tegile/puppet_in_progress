Puppet::Type.newtype(:iscsi_target) do
  @doc = "Type for create/delete template"
  Puppet.info("##Inside type_root_iscsi_target")

  apply_to_device
  ensurable

  ##this will go away once target creation is managed by group creations with members
  autorequire(:iscsi_target_group) do
      self[:iscsi_target_group]
  end

  newparam(:iscsi_target_name) do
    #desc "The name of the host. "
    isnamevar
    Puppet.info("##Inside type_param_iscsi_target_name")
  end

  newparam(:iscsi_target_alias) do
    Puppet.info("##Inside type_param_target_alias")
  end

  newparam(:iscsi_target_group) do
    Puppet.info("##Inside type_param_iscsi_target_group")
  end

  newparam(:iscsi_target_auth) do
    Puppet.info("##Inside type_param_iscsi_target_auth")
    defaultto :"none"
  end

  newparam(:iscsi_target_chap_name) do
    Puppet.info("##Inside type_param_iscsi_target_chap_name")
  end

  newparam(:iscsi_target_chap_secret) do
    Puppet.info("##Inside type_param_iscsi_target_chap_secret")
  end

  newparam(:iscsi_target_ip) do
    Puppet.info("##Inside type_param_iscsi_target_ip")
  end

  newparam(:iscsi_target_port) do
    Puppet.info("##Inside type_param_iscsi_target_port")
    defaultto :"3260"
  end

  newparam(:pool_name) do
    Puppet.info("##Inside type_param_pool_name")
  end

 end
