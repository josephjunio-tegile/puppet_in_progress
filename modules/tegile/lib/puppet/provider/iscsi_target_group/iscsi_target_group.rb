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
    # puts create_check["code"]

    if defined?(create_check["code"])
      if create_check["code"] == "EZEBI_RESOURCE_EXIST"
        puts "found #{resource[:iscsi_target_group_name]}"
        return true
      else
        puts "error checking if #{resource[:iscsi_target_group_name]} exists"
        fail
      end
    end

    if defined?(create_check.value)
      if create_check.value == 0
        tegile_api_transport.iscsi_target_group_delete_fix(resource[:iscsi_target_group_name])
        return false
      else
        puts "error checking if #{resource[:iscsi_target_group_name]} exists"
        fail 
      end
    end

  end

end
