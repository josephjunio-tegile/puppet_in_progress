require 'puppet/provider/tegile'

Puppet::Type.type(:initiator_group).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for initiator group create/delete"
  Puppet.info("##Inside provider_root_initiator_group")

  def create
    Puppet.info("##Inside provider_initiator_group_create")
    tegile_api_transport.initiator_group_create(resource[:initiator_group_name])
  end

  def destroy
    Puppet.info("##Inside provider_initiator_group_destroy")
    tegile_api_transport.initiator_group_delete(resource[:initiator_group_name])
  end

  def exists?
    Puppet.info("##Inside provider_initiator_group_exists")
    tegile_api_transport.initiator_group_exists(resource[:initiator_group_name])
  end

  def members
    Puppet.info("##Inside provider_initiator_group_members_get")
    tegile_api_transport.initiator_group_members_get(resource[:initiator_group_name])
  end

  def members=(should)
    Puppet.info("##Inside provider_initiator_group_members_set")
  
    should.each do |x|
      puts x.inspect

      ##need to check here if in a group
      tegile_api_transport.initiator_group_members_set_list_in_group(x)

      ##this adds and will be switched for the move once in the sdk
      tegile_api_transport.initiator_group_members_set_add_to_group(resource[:initiator_group_name],x)
    end
    
    
  end

end
