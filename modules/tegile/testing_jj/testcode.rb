require "tegile-api"
#require 'json'

#Request access info for array
#puts "IntelliFlash Array IP?:"
#host = gets.chomp
#puts "IntelliFlash Array Username?:"
#username = gets.chomp
#puts "IntelliFlash Array Password?:"
#password = gets.chomp
#puts "Pool Name?"
#pool = gets.chomp


host = "10.65.3.30"
username = "admin"
password = "tegile1"
pool_name = "pool-a"
iscsi_target_group_name = "test-test"

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
  #config.debugging = true
end





# api_instance = IFClient::DataApi.new
# get_volume_param = IFClient::GetVolumeParam.new
# get_volume_param.arg0_dataset_path = "pool-a/Local/project1/lun1"
# begin
#   #Get the Volume details.
#   result = api_instance.get_volume_post(get_volume_param)
#   #puts result
#   status = result.override_views == false ? "no" : "yes"
#   puts "Override project mappings? #{status}"
# rescue IFClient::ApiError => e
#   error = JSON.parse("#{e.response_body}")
#   puts "Exception when calling TegileApi: #{error["message"]}"
# end

# api_instance = IFClient::DataApi.new
# inherit_property_from_project_param = IFClient::InheritPropertyFromProjectParam.new
# inherit_property_from_project_param.arg0_dataset_path = "pool-a/Local/project1/share1"
# inherit_property_from_project_param.arg1_prop_name = "AclInherit"
# begin
#   #Inherit properties from parent project settings (revert/rollback to parent setting)
#   result = api_instance.inherit_property_from_project_post(inherit_property_from_project_param)
#   puts result
# rescue IFClient::ApiError => e
#   error = JSON.parse("#{e.response_body}")
#   puts "Exception when calling TegileApi: #{error["message"]}"
# end


# api_instance = IFClient::SANApi.new
# create_target_group_param = IFClient::CreateTargetGroupParam.new
# create_target_group_param.arg0_target_group_name = iscsi_target_group_name
# create_target_group_param.arg1_pool_name = pool_name
# begin
#   ##Create a target group with the specified target group name in the resource group containing the named pool with the intended protocol
#   result = api_instance.create_target_group_post(create_target_group_param)
#   puts result

# rescue IFClient::ApiError => e
#   error = JSON.parse("#{e.response_body}")
#   puts "Exception when calling TegileApi: #{error["message"]}"
# end 