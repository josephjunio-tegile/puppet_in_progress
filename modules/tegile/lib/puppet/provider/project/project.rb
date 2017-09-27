require 'puppet/provider/tegile'

Puppet::Type.type(:project).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for project create/delete"
  Puppet.info("##Inside provider_root_project")

  def create
    Puppet.info("##Inside provider_project_create")
    tegile_api_transport.project_create(resource[:project_name],resource[:pool_name],resource[:compression_type],resource[:compressed_log],resource[:intended_protocol_list],resource[:quota],resource[:dedup],resource[:primary_cache],resource[:secondary_cache],resource[:acl_inherit],resource[:default_lun_size],resource[:default_lun_block_size],resource[:default_thin_provisioning],resource[:default_share_block_size])
    if resource[:intended_protocol_list] != nil
      enabled_protocols = resource[:intended_protocol_list].each {|x| x.downcase!}
      if enabled_protocols.include?("nfs")
        #puts "enabling nfs"
        tegile_api_transport.set_nfs_sharing_on(resource[:project_name],resource[:pool_name])
      end
    end
  end

  def destroy
    Puppet.info("##Inside provider_project_destroy")
    puts "Deleting projects not supported"
    fail
  end

  def exists?
    Puppet.info("##Inside provider_project_exists")
    tegile_api_transport.project_exists(resource[:project_name],resource[:pool_name])
  end

  def default_share_block_size
    Puppet.info("##Inside provider_project_default_share_block_size_get")
    tegile_api_transport.project_default_share_block_size_get(resource[:pool_name],resource[:project_name])
  end

  def default_share_block_size=(value)
    Puppet.info("##Inside provider_project_default_share_block_size_set")
    tegile_api_transport.project_default_share_block_size_set(value,resource[:pool_name],resource[:project_name])
  end

  def default_thin_provisioning
    Puppet.info("##Inside provider_project_default_thin_provisioning_get")
    tegile_api_transport.project_default_thin_provisioning_get(resource[:pool_name],resource[:project_name])
  end

  def default_thin_provisioning=(value)
    Puppet.info("##Inside provider_project_default_thin_provisioning_set")
    tegile_api_transport.project_default_thin_provisioning_set(value,resource[:pool_name],resource[:project_name])
  end

  def default_lun_block_size
    Puppet.info("##Inside provider_project_default_lun_block_size_get")
    tegile_api_transport.project_default_lun_block_size_get(resource[:pool_name],resource[:project_name])
  end

  def default_lun_block_size=(value)
    Puppet.info("##Inside provider_project_default_lun_block_size_set")
    tegile_api_transport.project_default_lun_block_size_set(value,resource[:pool_name],resource[:project_name])
  end

  def dedup
    Puppet.info("##Inside provider_project_dedup_get")
    tegile_api_transport.project_dedup_get(resource[:pool_name],resource[:project_name])
  end

  def dedup=(value)
    Puppet.info("##Inside provider_project_dedup_set")
    tegile_api_transport.project_dedup_set(value,resource[:pool_name],resource[:project_name])
  end

  def quota
    Puppet.info("##Inside provider_project_quota_get")
    tegile_api_transport.project_quota_get(resource[:pool_name],resource[:project_name])
  end

  def quota=(value)
    Puppet.info("##Inside provider_project_quota_set")
    tegile_api_transport.project_quota_set(value,resource[:pool_name],resource[:project_name])
  end

  def compressed_log
    Puppet.info("##Inside provider_project_compressed_log_get")
    tegile_api_transport.project_compressed_log_get(resource[:pool_name],resource[:project_name])
  end

  def compressed_log=(value)
    Puppet.info("##Inside provider_project_compressed_log_set")
    tegile_api_transport.project_compressed_log_set(value,resource[:pool_name],resource[:project_name])
  end

  def compression_type
    Puppet.info("##Inside provider_project_compression_type_get")
    tegile_api_transport.project_compression_type_get(resource[:pool_name],resource[:project_name])
  end

  def compression_type=(value)
    Puppet.info("##Inside provider_project_compression_type_set")
    tegile_api_transport.project_compression_type_set(value,resource[:pool_name],resource[:project_name])
  end

  def intended_protocol_list
    Puppet.info("##Inside provider_project_intended_protocol_list_get")
    tegile_api_transport.project_intended_protocol_list_get(resource[:pool_name],resource[:project_name])
  end

  def intended_protocol_list=(value)
    Puppet.info("##Inside provider_project_intended_protocol_list_set")
    tegile_api_transport.project_intended_protocol_list_set(value,resource[:pool_name],resource[:project_name])
  end

  def lun_mapping
    Puppet.info("##Inside provider_project_lun_mapping_get")
    tegile_api_transport.project_lun_mapping_get(resource[:pool_name],resource[:project_name])
  end

  def lun_mapping=(value)
    Puppet.info("##Inside provider_project_lun_mapping_set")
    tegile_api_transport.project_lun_mapping_set(value)
  end

end
