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

  def exists?
    Puppet.info("##Inside provider_iscsi_target_group_exists")
    #*use api to get all groups
    returned = tegile_api_transport.list_target_groups
    #*define variable to hold exists status 
    exists = nil
    #*check each target group for match, update exist status
    returned.each do |each|
      # puts each.target_group_name
      if each.target_group_name == resource[:iscsi_target_group_name]
        exists = true
        puts "found iscsi target group: #{each.target_group_name}"
      end
    end
    #*return status of exists
    return exists
  end

  def members
    Puppet.info("##Inside provider_iscsi_target_group_members_get")
    returned = tegile_api_transport.list_targets_in_target_group(resource[:iscsi_target_group_name])
    puts returned.inspect
    return returned
    # return "nope"
  end

  def members=(should)
    Puppet.info("##Inside provider_iscsi_target_group_members_set")


    is = tegile_api_transport.list_targets_in_target_group(resource[:iscsi_target_group_name])

    # puts "is: #{is.sort!}"
    # puts "should: #{should.sort!}"

    to_remove = is - should
    puts "remove:#{to_remove}"
    to_add = should - is
    puts "add:#{to_add}"
    
    #2do build method to do temp create for remove
    # if to_remove.length != 0
    #   to_remove.each do |string|
    #     tegile_api_transport.remove_initiator_from_group(string)
    #   end
    # end

    #2do once list is fixed add warning for add vs. move
    if to_add.length != 0
      to_add.each do |string|
        tegile_api_transport.move_target_to_target_group(string,resource[:iscsi_target_group_name],true)
      end
    end




    #!org code
    # puts should.inspect
    # should.each do |x|
    #   tegile_api_transport.move_target_to_target_group(x,resource[:iscsi_target_group_name])
    # end




  end

end
