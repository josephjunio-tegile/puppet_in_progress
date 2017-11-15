require 'tegile-api'

IFClient.configure do |config|
    # Configure HTTP basic authorization: basicAuth
    config.username = "admin"
    config.password = "tegile1"
    config.host = "10.65.3.30"
    config.verify_ssl = false
end

def initiator_group_members_set_list_in_group(initiator_name)
    api_instance = IFClient::SANApi.new
    get_initiator_group_param = IFClient::GetInitiatorGroupParam.new
    get_initiator_group_param.arg0_initiator_name = initiator_name
    begin
      ##Gets the name of the initiator group to which the initiator belongs.
      result = api_instance.get_initiator_group_post(get_initiator_group_param)
      puts result.inspect
      # return result
    rescue IFClient::ApiError => e
    #   error = JSON.parse("#{e.response_body}")
      puts "Exception when calling TegileApi: #{e.inspect}"
    end
end

def list_initiators_in_initiator_group_post(initiator_group_name)
    api_instance = IFClient::SANApi.new
    list_initiators_in_initiator_group_param = IFClient::ListInitiatorsInInitiatorGroupParam.new
    list_initiators_in_initiator_group_param.arg0_initiator_group_name = initiator_group_name
    begin
      ##Lists all initiators belonging to the specified initiator group.
      result = api_instance.list_initiators_in_initiator_group_post(list_initiators_in_initiator_group_param)
      puts result.inspect
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->list_initiators_in_initiator_group_post: #{e.inspect}"
    end
end

def list_targets_in_target_group_post(target_group_name)
    api_instance = IFClient::SANApi.new
    list_targets_in_target_group_param = IFClient::ListTargetsInTargetGroupParam.new
    list_targets_in_target_group_param.arg0_target_group_name = target_group_name
    begin
      #Lists all targets associated with the target group.
      result = api_instance.list_targets_in_target_group_post(list_targets_in_target_group_param)
      puts result.inspect
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->list_targets_in_target_group_post: #{e.inspect}"
    end
end

def move_target_to_target_group_post(target_name,new_target_group_name)
    api_instance = IFClient::SANApi.new
    move_target_to_target_group_param = IFClient::MoveTargetToTargetGroupParam.new
    move_target_to_target_group_param.arg0_target_name = target_name
    move_target_to_target_group_param.arg1_new_target_group_name = new_target_group_name
    begin
      #Move a target specified with targetName to a new target group specified with newTargetGroupName
      result = api_instance.move_target_to_target_group_post(move_target_to_target_group_param)
      puts result.inspect
    rescue IFClient::ApiError => e
      puts "Exception when calling SANApi->move_target_to_target_group_post: #{e.inspect}"
    end
end

def create_iscsi_target_post(target_suffix_name,target_group_name)
    api_instance = IFClient::SANApi.new
    new_iscsi_target = IFClient::ISCSITargetCreateV21.new
    new_iscsi_target.target_suffix_name = target_suffix_name
    new_iscsi_target.target_alias = target_suffix_name
    # new_iscsi_target.target_group_name = target_group_name
    new_iscsi_target.target_authentication_mode = "none"
    # new_iscsi_target.target_chap_name = 
    # new_iscsi_target.target_chap_secret = 
    new_iscsi_target.target_network_binding = ["10.65.3.34:3260"]
    create_iscsi_target_param = IFClient::CreateISCSITargetParam.new
    create_iscsi_target_param.arg0_iscsi_target = new_iscsi_target
    begin
      #Create an iSCSI Target
      result = api_instance.create_iscsi_target_post(create_iscsi_target_param)
      puts result.inspect
    rescue IFClient::ApiError => e
        error = JSON.parse("#{e.response_body}")
        puts "Exception when calling TegileApi(create_iscsi_target_post) #{error}"
    end
end



# initiator_group_members_set_list_in_group("iqn.2017-07.com.test:puppet-host1")
# list_initiators_in_initiator_group_post("puppet-initiator-group1")
# list_targets_in_target_group_post("iscsi-target-group3")
# move_target_to_target_group_post("iqn.2012-02.com.tegile:iscsi-target4","iscsi-target-group3")
create_iscsi_target_post("ruby-test2","puppet-iscsi-target-group1")