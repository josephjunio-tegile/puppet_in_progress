Puppet::Type.newtype(:iscsi_target_group) do
  @doc = "Type for create/delete iscsi_target_group"
  Puppet.info("##Inside type_root_iscsi_target_group")

  apply_to_device
  ensurable

  #*need to require any targets that are listed in members. Need to drop the iscsi prefix added via munge
  autorequire(:iscsi_target) do
    if self[:members] != nil
      required = []
      self[:members].each do |string|
        no_suffix = string.reverse.chomp("iqn.2012-02.com.tegile:".reverse)
        required << no_suffix.reverse
      end
      # puts required.inspect
      required
    end
  end

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
    #*add the prefix to defined target names
    munge do |each|
      "iqn.2012-02.com.tegile:" + each
    end
    #*Custom sync method to compare sorted values
    def insync?(is)
      is.sort! == should.sort!
    end
  end

end
