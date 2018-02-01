require "tegile-api"

host = "10.65.3.30"
username = "admin"
password = "tegile1"
pool_name = "pool-a"
project_name = "project1"

def it_view_v21_to_array(itviewv21_array)
  return_array = []
  itviewv21_array.each do |sub_array|
      array = []
      array[0] = sub_array.host_group_name
      array[1] = sub_array.target_group_name
      array[2] = sub_array.lun_nbr
      array[3] = sub_array.read_only
      return_array << array
  end
  return return_array
end

def array_to_it_view_v21(array)
  return_array = []
  array.each do |sub_array|
      array = IFClient::ITViewV21.new
      array.host_group_name = sub_array[0]
      array.target_group_name = sub_array[1]
      array.lun_nbr = sub_array[2]
      array.read_only = sub_array[3]
      return_array << new_mapping
  end
  return return_array
end

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
  #config.debugging = true
end

##convert into array to match .pp file


##code to get mappings
def get_project_mapping(pool_name,project_name)
  api_instance = IFClient::SANApi.new
  get_project_default_iscsi_it_view_param = IFClient::GetProjectDefaultIscsiITViewParam.new
  get_project_default_iscsi_it_view_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
  begin
    ##List all of the default iSCSI views of the project
    result = api_instance.get_project_default_iscsi_it_view_post(get_project_default_iscsi_it_view_param)
    #result.sort! {|a,b| a.host_group_name <=> b.host_group_name}
    #result.sort! {|a,b| a.target_group_name <=> b.target_group_name}
    #result.each {|x| puts x.inspect}
    #puts result
    result_array = it_view_v21_to_array(result)
    return result_array
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    puts "Exception when calling TegileApi: #{error["message"]}"
  end 
end

##code to set mappings
def set_project_mapping(pool_name,project_name,initiator_group_name,target_group_name,read_only)
  api_instance = IFClient::SANApi.new
  create_mapping_for_project_param = IFClient::CreateMappingForProjectParam.new
  create_mapping_for_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
  create_mapping_for_project_param.arg1_initiator_group_name = initiator_group_name
  create_mapping_for_project_param.arg2_target_group_name = target_group_name
  create_mapping_for_project_param.arg3_read_only = read_only
  begin
    ##Create a project level default mapping
    result = api_instance.create_mapping_for_project_post(create_mapping_for_project_param)
    puts result.inspect
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    puts "Exception when calling TegileApi: #{error["message"]}"
  end 
end

##code to remove mappings
def remove_project_mapping(pool_name,project_name,initiator_group_name,target_group_name)
  api_instance = IFClient::SANApi.new
  delete_mapping_from_project_param = IFClient::DeleteMappingFromProjectParam.new
  delete_mapping_from_project_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
  delete_mapping_from_project_param.arg1_initiator_group_name = initiator_group_name
  delete_mapping_from_project_param.arg2_target_group_name = target_group_name
  begin
    ##Deletes the view (mapping) between the given project, initiator group, and target group.
    result = api_instance.delete_mapping_from_project_post(delete_mapping_from_project_param)
    puts result.inspect
  rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    puts "Exception when calling TegileApi: #{error["message"]}"
  end 
end

##convert api result to plain array
#is_array = it_view_v21_to_array(result)
# print is_array
# puts

##current mapping__tool to fake what api returns
#fake_result = [["ig1","tg1",-1,false],["ig2","tg1",-1,false],["ig3","tg1",-1,false],["ig4","tg2",-1,false],["ig11","tg3",-1,false]]


##new mapping
input = [["initiator-group1", "iscsi-target-group1", -1, false], ["initiator-group2", "iscsi-target-group2", -1, false], ["initiator-group3", "iscsi-target-group3", -1, false]]
# print input
# puts



##function to compare lists
is = get_project_mapping(pool_name,project_name)
should = input
#is.each {|x| puts x.inspect}
#should.each {|x| puts x.inspect}
is_unique = is - should
should_unique = should - is
# puts "remove..."
# puts is_unique.inspect
# is_unique.each {|x| puts x.inspect}
# puts "add..."
# puts should_unique.inspect
# should_unique.each {|x| puts x.inspect}
if should_unique.length != 0
  should_unique.each do |sub_array|
    set_project_mapping(pool_name,project_name,sub_array[0],sub_array[1],sub_array[3])
    puts "#{sub_array[0]} added"
  end
elsif is_unique.length != 0
  is_unique.each do |sub_array|
    remove_project_mapping(pool_name,project_name,sub_array[0],sub_array[1])
    puts "#{sub_array[0]} removed"
  end
else
  puts "nothing to change"
end
