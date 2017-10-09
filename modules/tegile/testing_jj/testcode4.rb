require "tegile-api"

def array_to_it_view_v21(array)
    return_array = []
    array.each do |sub_array|
        array = IFClient::ITViewV21.new
        array.host_group_name = sub_array[0]
        array.target_group_name = sub_array[1]
        array.lun_nbr = sub_array[2]
        array.read_only = sub_array[3]
        return_array << array
    end
return return_array
end


is = [["initiator-group1", "iscsi-target-group2", 0, false],["initiator-group3", "iscsi-target-group4", 0, false]]
should = [["initiator-group1", "iscsi-target-group2", -1, false],["initiator-group3", "iscsi-target-group4", -1, false]]

is_class = array_to_it_view_v21(is)
should_class = array_to_it_view_v21(should)


is_class.each do |sub_array|
    if sub_array.host_group_name + sub_array.target_group_name == should_class[0].host_group_name + should_class[0].target_group_name
        puts "matches"
    end
    if sub_array.host_group_name + sub_array.target_group_name != should_class[0].host_group_name + should_class[0].target_group_name
        puts "not matches"
    end
end

#   puts is_class.inspect
#   puts should_class.inspect

#   remove = is_class - should_class
#   puts remove
#   add = should_class - is_class
#   puts add