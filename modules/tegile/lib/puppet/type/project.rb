Puppet::Type.newtype(:project) do
  @doc = "Type for create/delete project"
  Puppet.info("##Inside type_root_project")

  apply_to_device
  ensurable

  newparam(:project_name) do
    isnamevar
    Puppet.info("##Inside type_param_project_name")
  end

  newparam(:pool_name) do
    Puppet.info("##Inside type_param_pool_name")
  end
  
  newproperty(:compression_type) do
    Puppet.info("##Inside type_property_compression_type")
    defaultto :lz4
  end

  newproperty(:compressed_log) do
    Puppet.info("##Inside type_property_compressed_log")
    defaultto :lz4
  end

  newproperty(:intended_protocol_list, :array_matching => :all) do
    Puppet.info("##Inside type_property_intended_protocol_list")
  end

  newproperty(:quota) do
    Puppet.info("##Inside type_property_quota")
    ##In Bytes
  end

  newproperty(:dedup) do
    Puppet.info("##Inside type_property_dedup")
    defaultto :on
  end

  newparam(:primary_cache) do
    Puppet.info("##Inside type_param_primary_cache")
  end

  newparam(:secondary_cache) do
    Puppet.info("##Inside type_param_secondary_cache")
  end

  newparam(:acl_inherit) do
    Puppet.info("##Inside type_param_acl_inherit")
  end

  newparam(:default_lun_size) do
    Puppet.info("##Inside type_param_default_lun_size")
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

  newproperty(:lun_mapping, :array_matching => :all) do
    Puppet.info("##Inside type_property_lun_mapping")
    #new_value = []
    puts "@should is next"
    puts @should.inspect
    # munge do |value|
    #   new_value << value
    #   puts new_value.inspect
    #   return new_value
    #   #value.sort! {|a,b| a[0] <=> b[0]}
    #   #value.sort! {|a,b| a[1] <=> b[1]}
    # end
  end

end
