Puppet::Type.newtype(:project) do
  @doc = "Type for create/delete project"
  Puppet.info("##Inside type_root_project")

  apply_to_device
  ensurable

  validate do
    if self[:nfs_network_acls] != nil
      if self[:intended_protocol_list].include?("NFS") != true
        fail "NFS not enabled via intended_protocol_list"
      end
    end
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
  
  newparam(:project_name) do
    isnamevar
    Puppet.info("##Inside type_param_project_name")
  end

  newparam(:pool_name) do
    Puppet.info("##Inside type_param_pool_name")
  end
  
  newproperty(:compression_class) do
    Puppet.info("##Inside type_property_compression_class")
    munge do |value|
      upcase = value.upcase
      case upcase
      when "HIGH COMPRESSION"
        return "High Compression"
      when "OPTIMAL PERFORMANCE"
        return "Optimal Performance"
      when "OFF"
        return "OFF"
      when "INHERIT"
        return "inherit"
      end
      # return upcase
    end
  end
  
  newproperty(:compression_type) do
    Puppet.info("##Inside type_property_compression_type")
  end

  newproperty(:compressed_log) do
    Puppet.info("##Inside type_property_compressed_log")
  end

  #! going away
  newproperty(:intended_protocol_list, :array_matching => :all) do
    Puppet.info("##Inside type_property_intended_protocol_list")
    ##Make sure value in manifest is all uppercase
    munge do |value|
      upcase = value.upcase
      if upcase == "ISCSI"
        return "iSCSI"
      end
      return upcase
    end
  end

  newproperty(:share_protocol) do
    Puppet.info("##Inside type_property_share_protocol")
    ## Upcase so that we can compare
    munge do |value|
      upcase = value.upcase
      return upcase
    end
  end

  newproperty(:quota) do
    Puppet.info("##Inside type_property_quota")
    munge do |value|
      value*1024*1024*1024
    end
  end

  newproperty(:dedup) do
    Puppet.info("##Inside type_property_dedup")
  end

  newproperty(:read_cache) do
    Puppet.info("##Inside type_project_property_read_cache")
  end

  newproperty(:primary_cache) do
    Puppet.info("##Inside type_project_property_primary_cache")
  end

  newproperty(:secondary_cache) do
    Puppet.info("##Inside type_project_property_secondary_cache")
  end

  newproperty(:acl_inherit) do
    Puppet.info("##Inside type_project_property_acl_inherit")
  end

  newproperty(:readonly) do
    Puppet.info("##Inside type_project_property_readonly")
  end

  newproperty(:default_lun_size) do
    Puppet.info("##Inside type_property_default_lun_size")
    munge do |value|
      value*1024*1024*1024
    end
  end

  newproperty(:default_lun_block_size) do
    Puppet.info("##Inside type_property_default_lun_block_size")
  end

  newproperty(:default_thin_provisioning) do
    Puppet.info("##Inside type_property_default_thin_provisioning")
  end

  newproperty(:default_share_block_size) do
    Puppet.info("##Inside type_property_default_share_block_size")
  end

  newproperty(:lun_mappings, :array_matching => :all) do
    Puppet.info("##Inside type_property_lun_mapping")
    ##custom insync? method to compare unsorted values
    def insync?(is)
      ##Find unique entries
      is_unique = is - should
      should_unique = should - is
      ##Combine variables and check if empty
      diff = is_unique + should_unique
      diff.length == 0 ? true : false
    end
    ##validate lun mapping value in manifest, this value is not passed to the method so we want to confirm intended behavior
    validate do |value|
      unless value[2] == -1
        fail "lun number must be set to -1 on project mappings"
      end
    end
  end

  newproperty(:nfs_network_acls, :array_matching => :all) do
    Puppet.info("##Inside type_property_nfs_network_acls")
    ##custom insync? method to compare unsorted values
    def insync?(is)
      ##Find unique entries
      is_unique = is - should
      should_unique = should - is
      ##Combine variables and check if empty
      diff = is_unique + should_unique
      diff.length == 0 ? true : false
    end
  end

  newparam(:mount_point) do
    Puppet.info("##Inside type_param_mount_point")
  end
  
end
