require "tegile-api"

host = "10.65.3.30"
username = "admin"
password = "tegile1"
pool_name = "pool-a"
project_name = "project1"

#static_result = 

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
  #config.debugging = true
end



# api_instance = IFClient::SANApi.new
# get_project_default_iscsi_it_view_param = IFClient::GetProjectDefaultIscsiITViewParam.new
# get_project_default_iscsi_it_view_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
# begin
#   #List all of the default iSCSI views of the project
#   result = api_instance.get_project_default_iscsi_it_view_post(get_project_default_iscsi_it_view_param)
#   result.sort! {|a,b| a.host_group_name <=> b.host_group_name}
#   result.sort! {|a,b| a.target_group_name <=> b.target_group_name}
#   result.each {|x| puts x.inspect}
# rescue IFClient::ApiError => e
#   error = JSON.parse("#{e.response_body}")
#   puts "Exception when calling TegileApi: #{error["message"]}"
# end 



##current mapping__tool to fake what api returns
# result = [["ig1","tg1",-1,false],["ig2","tg1",-1,false],["ig3","tg1",-1,false],["ig4","tg2",-1,false],["ig11","tg3",-1,false],["ig12","tg3",-1,false]]
# current_mappings_array = []
# result.each do |sub_array|
#     current_mapping = IFClient::ITViewV21.new
#     current_mapping.host_group_name = sub_array[0]
#     current_mapping.target_group_name = sub_array[1]
#     current_mapping.lun_nbr = sub_array[2]
#     current_mapping.read_only = sub_array[3]
#     current_mappings_array << current_mapping
# end
# current_mappings_array.sort! {|a,b| a.host_group_name <=> b.host_group_name}
# current_mappings_array.sort! {|a,b| a.target_group_name <=> b.target_group_name}
# #current_mappings_array.each {|x| puts x.inspect}
# puts current_mappings_array.inspect

# puts
# puts

##new mapping
input = [["ig1","tg1",-1,false],["ig12","tg3",-1,false],["ig2","tg1",-1,false],["ig4","tg2",-1,false],["ig3","tg1",-1,false],["ig11","tg3",-1,false]]
mappings_array = []
input.each do |sub_array|
    new_mapping = IFClient::ITViewV21.new
    new_mapping.host_group_name = sub_array[0]
    new_mapping.target_group_name = sub_array[1]
    new_mapping.lun_nbr = sub_array[2]
    new_mapping.read_only = sub_array[3]
    mappings_array << new_mapping
end
mappings_array.sort! {|a,b| a.host_group_name <=> b.host_group_name}
mappings_array.sort! {|a,b| a.target_group_name <=> b.target_group_name}
mappings_array.each {|x| puts x.inspect}


##convert into array to match .pp file
clean_mappings_array = []
mappings_array.each do |sub_array|
  clean_mapping = []
  clean_mapping[0] = sub_array.host_group_name
  clean_mapping[1] = sub_array.target_group_name
  clean_mapping[2] = sub_array.lun_nbr
  clean_mapping[3] = sub_array.read_only
  clean_mappings_array << clean_mapping
end
clean_mappings_array.each {|x| puts x.inspect}



#puts current_mappings_array.==(mappings_array)