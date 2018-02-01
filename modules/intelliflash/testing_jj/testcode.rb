require "tegile-api"

host = "10.65.103.80"
username = "admin"
password = "tegile"
# pool_name = "pool-a"
# project_name = "project1"

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
  #config.debugging = true
end

puts "get_initiator_group"
api_instance = IFClient::SANApi.new
get_initiator_group_param = IFClient::GetInitiatorGroupParam.new # GetInitiatorGroupParam | 
get_initiator_group_param.arg0_initiator_name = "iqn.2017-07.com.test:puppet-host1"
begin
  #Gets the name of the initiator group to which the initiator belongs.
  result = api_instance.get_initiator_group_post(get_initiator_group_param)
  puts result.inspect
rescue IFClient::ApiError => e
  puts "Exception when calling SANApi->get_initiator_group_post: #{e}"
end

# puts "list_iscsi_initiators_post"
# api_instance = IFClient::SANApi.new
# list_iscsi_initiators_param = IFClient::ListISCSIInitiatorsParam.new # ListISCSIInitiatorsParam | 
# list_iscsi_initiators_param.arg0_initiator_name_pattern = ".*"
# begin
#   #List iSCSI Initiators with name matching specified pattern
#   result = api_instance.list_iscsi_initiators_post(list_iscsi_initiators_param)
#   puts result
# rescue IFClient::ApiError => e
#   puts "Exception when calling SANApi->list_iscsi_initiators_post: #{e}"
# end


# api_instance = IFClient::SANApi.new
# begin
#   #List all initiator groups available on IntelliFlash Array
#   result = api_instance.list_initiator_groups_get
#   puts result
# rescue IFClient::ApiError => e
#   puts "Exception when calling SANApi->list_initiator_groups_get: #{e}"
# end