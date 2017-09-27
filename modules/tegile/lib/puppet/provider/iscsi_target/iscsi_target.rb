require 'puppet/provider/tegile'

Puppet::Type.type(:iscsi_target).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for iscsi target create/delete"
  Puppet.info("##Inside provider_root_iscsi_target")

  def create
    Puppet.info("##Inside provider_iscsi_target_create")
    tegile_api_transport.iscsi_target_create(resource[:iscsi_target_name],resource[:iscsi_target_alias],resource[:iscsi_target_group],resource[:iscsi_target_auth],resource[:iscsi_target_chap_name],resource[:iscsi_target_chap_secret],resource[:iscsi_target_ip],resource[:iscsi_target_port])
  end

  def destroy
    Puppet.info("##Inside provider_iscsi_target_destroy")
    tegile_api_transport.iscsi_target_delete(resource[:iscsi_target_name])
  end

  def exists?
    Puppet.info("##Inside provider_iscsi_target_exists")
    tegile_api_transport.iscsi_target_exists(resource[:iscsi_target_name])
  end

end
