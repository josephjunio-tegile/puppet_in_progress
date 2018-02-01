require 'puppet/provider/tegile'

Puppet::Type.type(:iscsi_target).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for iscsi target create/delete"
  Puppet.info("##Inside provider_root_iscsi_target")

  def create
    Puppet.info("##Inside provider_iscsi_target_create")
    #*create temp target group. api doesnt allow target creation without a group
    temp_target_group = "temp-tg"
      #*api to create temp target group
    tegile_api_transport.iscsi_target_group_create(temp_target_group,resource[:pool_name])
      #*api call to create iscsi target with temp target group
    tegile_api_transport.iscsi_target_create(resource[:iscsi_target_name],resource[:iscsi_target_alias],temp_target_group,resource[:iscsi_target_auth],resource[:iscsi_target_chap_name],resource[:iscsi_target_chap_secret],resource[:iscsi_target_ip],resource[:iscsi_target_port])
      #*api call to delete temp target group
    tegile_api_transport.iscsi_target_group_delete(temp_target_group)
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
