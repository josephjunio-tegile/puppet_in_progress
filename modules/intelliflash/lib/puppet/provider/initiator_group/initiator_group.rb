require 'puppet/provider/tegile'

Puppet::Type.type(:initiator_group).provide(:lun,:parent => Puppet::Provider::Tegile) do
  desc "Provider for initiator group create/delete"
  Puppet.info("##Inside provider_root_initiator_group")

  def create
    Puppet.info("##Inside provider_initiator_group_create")
    tegile_api_transport.initiator_group_create(resource[:initiator_group_name])
  end

  def destroy
    Puppet.info("##Inside provider_initiator_group_destroy")
    tegile_api_transport.initiator_group_delete(resource[:initiator_group_name])
  end

  def exists?
    Puppet.info("##Inside provider_initiator_group_exists")
    tegile_api_transport.initiator_group_exists(resource[:initiator_group_name])
  end

  def members
    Puppet.info("##Inside provider_initiator_group_members_get")
    tegile_api_transport.initiator_group_members_get(resource[:initiator_group_name])
  end

  #*Define "is", find diff, use method to remove/add
  def members=(should)
    Puppet.info("##Inside provider_initiator_group_members_set")

    is = tegile_api_transport.initiator_group_members_get(resource[:initiator_group_name])

    # puts "is: #{is}"
    # puts "should: #{should}"

    to_remove = is - should
    # puts "remove:#{to_remove}"
    to_add = should - is
    # puts "add:#{to_add}"
    
    if to_remove.length != 0
      to_remove.each do |string|
        tegile_api_transport.remove_initiator_from_group(string)
      end
    end

    #2do once list is fixed add warning for add vs. move
    if to_add.length != 0
      to_add.each do |string|
        tegile_api_transport.move_initiator_to_initiator_group(string,resource[:initiator_group_name],true)
      end
    end

    #!method in SDK is messed up
    # current_group = tegile_api_transport.initiator_group_members_set_list_in_group(x)
   
  end

end
