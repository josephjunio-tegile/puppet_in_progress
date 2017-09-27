require 'puppet/provider/tegile'

Puppet::Type.type(:share_nfs_network_acl).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for share_nfs_network_acl create/delete"
  Puppet.info("##Inside provider_root_share_nfs_network_acl")

  def create
    Puppet.info("##Inside provider_share_nfs_network_acl_create")
    tegile_api_transport.share_nfs_network_acl_create(resource[:pool_name],resource[:project_name],resource[:share_name],resource[:acl_type],resource[:acl_host],resource[:access_mode])
  end

  def destroy
    Puppet.info("##Inside provider_share_nfs_network_acl_destroy")
    tegile_api_transport.share_nfs_network_acl_delete(resource[:pool_name],resource[:project_name],resource[:share_name],resource[:acl_type],resource[:acl_host])
  end

  def exists?
    Puppet.info("##Inside provider_share_nfs_network_acl_exists")
    tegile_api_transport.share_nfs_network_acl_exists(resource[:pool_name],resource[:project_name],resource[:share_name],resource[:acl_type],resource[:acl_host])
  end

end
