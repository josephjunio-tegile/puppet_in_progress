require 'puppet/provider/tegile'

Puppet::Type.type(:lun).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for LUN create/delete"
  Puppet.info("##Inside provider_root_lun")

  def create
    Puppet.info("##Inside provider_lun_create")
    tegile_api_transport.lun_create(resource[:lun_name],resource[:pool_name],resource[:project_name],resource[:lun_protocol],resource[:lun_size],resource[:block_size])
    if resource[:inherit_mappings] == false
      tegile_api_transport.lun_mapping_create(resource[:pool_name],resource[:project_name],resource[:lun_name],resource[:initiator_group_name],resource[:target_group_name])
    end
  end

  def destroy
    Puppet.info("##Inside provider_lun_destroy")
    tegile_api_transport.lun_delete(resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def exists?
    Puppet.info("##Inside provider_lun_exists")
    tegile_api_transport.lun_exists(resource[:lun_name],resource[:pool_name],resource[:project_name])
  end

  def inherit_mappings
   Puppet.info("##Inside provider_inherit_mappings_get")
   tegile_api_transport.lun_mapping_inherit_get(resource[:pool_name],resource[:project_name],resource[:lun_name])
  end

  def inherit_mappings=(value)
   Puppet.info("##Inside provider_inherit_mappings_set")
   if value == "yes"
     tegile_api_transport.lun_mapping_inherit_set(resource[:pool_name],resource[:project_name],resource[:lun_name])
   else
     puts "will set explict mappings here"
   end
  end

end
