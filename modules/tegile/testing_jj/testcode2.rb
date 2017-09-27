require "tegile-api"

host = "10.65.3.30"
username = "admin"
password = "tegile1"
pool_name = "pool-a"
project_name = "project1"

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
  #config.debugging = true
end



api_instance = IFClient::SANApi.new
get_project_default_iscsi_it_view_param = IFClient::GetProjectDefaultIscsiITViewParam.new
get_project_default_iscsi_it_view_param.arg0_dataset_path = "#{pool_name}/Local/#{project_name}"
begin
  #List all of the default iSCSI views of the project
  result = api_instance.get_project_default_iscsi_it_view_post(get_project_default_iscsi_it_view_param)
  puts "here comes result"
  puts result
rescue IFClient::ApiError => e
  error = JSON.parse("#{e.response_body}")
  puts "Exception when calling TegileApi: #{error["message"]}"
end 