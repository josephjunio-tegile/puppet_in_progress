
##New rescue code bit



rescue IFClient::ApiError => e
      begin
        data = JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0]
      rescue JSON::ParserError => e
        if %w(String Date DateTime).include?(return_type)
          data = body
        else
          raise e
        end
      end
      errorModel = api_instance.api_client().convert_to_type( data, 'ErrorModel')
      puts "Exception when calling lun_exits: #{errorModel.message}"
      fail
    end

