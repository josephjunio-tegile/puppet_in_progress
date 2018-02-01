Puppet::Type.newtype(:initiator_group) do
  @doc = "Type for create/delete initiator group"
  Puppet.info("##Inside type_root_initiator_group")

  apply_to_device
  ensurable

  #*need to require any initiators that are listed in members
  autorequire(:initiator) do
    if self[:members] != nil
      required = []
      self[:members].each do |string|
        required << string
      end
      required
    end
  end

  newparam(:initiator_group_name) do
    isnamevar
    Puppet.info("##Inside type_param_initiator_group_name")
  end

  newproperty(:members, :array_matching => :all) do
    Puppet.info("##Inside type_param_initiator_group_members")
    #*Custom sync method to compare sorted values
    def insync?(is)
      is.sort! == should.sort!
    end
  end

 end
