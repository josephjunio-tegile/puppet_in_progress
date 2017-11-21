##convert into array to match .pp file
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

##outputs array in readable format
array.each {|x| puts x.inspect}

##unneeded sort commands
mappings_array.sort! {|a,b| a.host_group_name <=> b.host_group_name}
mappings_array.sort! {|a,b| a.target_group_name <=> b.target_group_name}

##command to compare sets of ITViewV21
puts array.==(array_to_compared)

##Code for create an fail
if result.value == 0
    puts "#{iscsi_target_name} created"
  else
    fail "Error with TegileApi(method_name)"
  end
rescue IFClient::ApiError => e
    error = JSON.parse("#{e.response_body}")
    fail "Exception when calling TegileApi(method_name): #{error["message"]}"
end