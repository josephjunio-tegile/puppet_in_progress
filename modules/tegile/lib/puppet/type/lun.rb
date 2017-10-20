Puppet::Type.newtype(:lun) do
  @doc = "Type for create/delete LUN"
  Puppet.info("##Inside type_root_lun")

  apply_to_all
  ensurable

  autorequire(:project) do
      self[:project_name]
  end

  autorequire(:initiator_group) do
    if self[:lun_mappings] != nil
      required_initiator_groups = []
      self[:lun_mappings].each do |sub_array|
        required_initiator_groups << sub_array[0]
      end
      required_initiator_groups
    end
  end

 autorequire(:iscsi_target_group) do
    if self[:lun_mappings] != nil
      required_target_groups = []
      self[:lun_mappings].each do |sub_array|
        required_target_groups << sub_array[1]
      end
      required_target_groups
    end
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

  newproperty(:override_project_mappings) do
    Puppet.info("##Inside type_property_override_project_mappings")
  end

  newproperty(:lun_mappings, :array_matching => :all) do
    Puppet.info("##Inside type_property_lun_mappings")
    ##custom insync? method to compare unsorted values
    def insync?(is)
      should_itview = RubyMethods.array_of_arrays_to_it_view_v21(should)
      is_itview = RubyMethods.array_of_arrays_to_it_view_v21(is)
      missing = RubyMethods.find_it_view_v21_to_create(should_itview,is_itview)
      extra = RubyMethods.find_it_view_v21_to_delete(should_itview,is_itview)
      ##Combine variables and check if empty
      diff = missing + extra
      diff.length == 0 ? true : false
    end
  end

 end
