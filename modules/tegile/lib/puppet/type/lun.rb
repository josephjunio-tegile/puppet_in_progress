Puppet::Type.newtype(:lun) do
  @doc = "Type for create/delete LUN"
  Puppet.info("##Inside type_root_lun")

  apply_to_all
  ensurable

  autorequire(:project) do
      self[:project_name]
  end

  newparam(:lun_name) do
    isnamevar
    Puppet.info("##Inside type_param_lun_name")
  end

  newparam(:pool_name) do
    Puppet.info("##Inside type_param_pool_name")
  end

  newparam(:project_name) do
    Puppet.info("##Inside type_param_project_name")
  end

  newparam(:lun_size) do
    ##Set in bytes
    Puppet.info("##Inside type_param_lun_size")
  end

  newparam(:block_size) do
    ##4KB,8KB,16KB,32KB,64KB,128KB
    Puppet.info("##Inside type_param_block_size")
    defaultto :"32KB"
  end

  newparam(:lun_protocol) do
    ##iSCSI,FC
    Puppet.info("##Inside type_param_lun_protocol")
    defaultto :iSCSI
  end

  newproperty(:inherit_mappings) do
    ##yes.no
    Puppet.info("##Inside type_param_inherit_mappings")
  end

 end
