require 'puppet/provider/tegile'

Puppet::Type.type(:initiator).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for initiator create/delete"
  Puppet.info("##Inside provider_root_initiator")

  def create
    Puppet.info("##Inside provider_initiator_create")
    tegile_api_transport.initiator_create(resource[:initiator_name],resource[:initiator_chap_user_name],resource[:initiator_chap_secret])
  end

  def destroy
    Puppet.info("##Inside provider_initiator_destroy")
    tegile_api_transport.initiator_delete(resource[:initiator_name])
  end

  def exists?
    Puppet.info("##Inside provider_initiator_exists")
    tegile_api_transport.initiator_exists(resource[:initiator_name])
  end

end
