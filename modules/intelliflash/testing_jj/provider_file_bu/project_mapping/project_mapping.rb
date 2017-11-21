require 'puppet/provider/tegile'

Puppet::Type.type(:project_mapping).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for project mapping create/delete"
  Puppet.info("##Inside provider_root_project_mapping")

  def create
    Puppet.info("##Inside provider_project_mapping_create")
    tegile_api_transport.project_mapping_create(resource[:pool_name],resource[:project_name],resource[:initiator_group_name],resource[:target_group_name])
  end

  def destroy
    Puppet.info("##Inside provider_project_mapping_destroy")
    tegile_api_transport.project_mapping_delete(resource[:pool_name],resource[:project_name],resource[:initiator_group_name],resource[:target_group_name])
  end
  
  def exists?
    Puppet.info("##Inside provider_project_mapping_exists")
    tegile_api_transport.project_mapping_exists(resource[:pool_name],resource[:project_name],resource[:initiator_group_name],resource[:target_group_name])
  end

end
