require 'puppet/provider/tegile'

Puppet::Type.type(:iscsi_target_group).provide(:lun,:parent => Puppet::Provider::Tegile) do
  Puppet.info("##Inside provider_root_iscsi_target_group")

  def create
    Puppet.info("##Inside provider_iscsi_target_group_create")
    tegile_api_transport.iscsi_target_group_create(resource[:iscsi_target_group_name],resource[:pool_name])
  end

  def destroy
    Puppet.info("##Inside provider_iscsi_target_group_destroy")
    tegile_api_transport.iscsi_target_group_delete(resource[:iscsi_target_group_name])
  end

  def exists?    ##Workaround implemented here due to api not returning ununsed groups
    Puppet.info("##Inside provider_iscsi_target_group_exists")
    #tegile_api_transport.iscsi_target_group_exists(resource[:iscsi_target_group_name])
    create_check = tegile_api_transport.iscsi_target_group_create_fix(resource[:iscsi_target_group_name],resource[:pool_name])
    #puts create_check
    if create_check == 0
      tegile_api_transport.iscsi_target_group_delete_fix(resource[:iscsi_target_group_name])
      return false
    elsif create_check.include? "already exists"
      puts "found #{resource[:iscsi_target_group_name]}"
      return true
    else
      puts "error checking for #{resource[:iscsi_target_group_name]}"
      puts create_check
      fail
    end
  end

end
