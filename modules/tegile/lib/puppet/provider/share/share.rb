require 'puppet/provider/tegile'

Puppet::Type.type(:share).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for share create/delete"
  Puppet.info("##Inside provider_root_share")

  def create
    Puppet.info("##Inside provider_share_create")
    tegile_api_transport.share_create(resource[:pool_name],resource[:project_name],resource[:share_name],resource[:block_size])
  end

  def destroy
    Puppet.info("##Inside provider_share_destroy")
    tegile_api_transport.share_delete(resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def exists?
    Puppet.info("##Inside provider_share_exists")
    tegile_api_transport.share_exists(resource[:share_name],resource[:pool_name],resource[:project_name])
  end

  def override_project_nfs_network_acls
    Puppet.info("##Inside provider_share_override_project_network_acls_get")
    tegile_api_transport.share_acl_inherit_get(resource[:pool_name],resource[:project_name],resource[:share_name])
  end

  def override_project_nfs_network_acls=(value)
    Puppet.info("##Inside provider_share_override_project_network_acls_set")
    puts "should be #{value}"
    tegile_api_transport.share_acl_inherit_set(resource[:pool_name],resource[:project_name],resource[:share_name])
  end

end
