require 'puppet/provider/tegile'

Puppet::Type.type(:initiator_group).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for initiator group create/delete"
  Puppet.info("##Inside provider_root_initiator_group")

  def create
    Puppet.info("##Inside provider_initiator_group_create")
    tegile_api_transport.initiator_group_create(resource[:initiator_group_name])
    puts "adding to holder to mark as iscsi"
    tegile_api_transport.add_initiator_to_initiator_group("iqn.2017-07.com.test:holder",resource[:initiator_group_name])
  end

  def destroy
    Puppet.info("##Inside provider_initiator_group_destroy")
    tegile_api_transport.initiator_group_delete(resource[:initiator_group_name])
  end

  def exists?
    Puppet.info("##Inside provider_initiator_group_exists")
    tegile_api_transport.initiator_group_exists(resource[:initiator_group_name])
  end

end
