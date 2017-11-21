require 'tegile-api'

def find_it_view_v21_to_create(should,is)
    matches_found = []
    should.each do |sub_array1|
        is.each do |sub_array2| 
            if sub_array1.lun_nbr == -1
                if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
                    # puts "-1 match found for #{sub_array1}"
                    matches_found << sub_array1
                end
            else
                if sub_array1 == sub_array2
                    # puts "match found for #{sub_array1}"
                    matches_found << sub_array1  
                end
            end
        end
    end
    missing = should - matches_found
    return missing 
end

def find_it_view_v21_to_delete(should,is)
    matches_found = []
    is.each do |sub_array1|
      should.each do |sub_array2| 
            if sub_array2.lun_nbr == -1
                if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
                    # puts "-1 match found for #{sub_array1}"
                    matches_found << sub_array1
                end        
            else
                if sub_array1 == sub_array2
                    # puts "match found for #{sub_array1}"
                    matches_found << sub_array1
                end
            end
        end
    end
    extra = is - matches_found
    return extra 
end

def array_of_arrays_to_it_view_v21(array_of_arrays)
    return_array = []
    array_of_arrays.each do |sub_array|
        array = IFClient::ITViewV21.new
        array.host_group_name = sub_array[0]
        array.target_group_name = sub_array[1]
        array.lun_nbr = sub_array[2]
        array.read_only = sub_array[3]
        return_array << array
    end
    return return_array
end


should = [["igroup1", "tgroup1", 1, false],["igroup2", "tgroup2", 2, false]]
is = [["igroup1", "tgroup1", 1, false],["igroup2", "tgroup2", 2, false],["igroup3", "tgroup3", 3, false]]

should_it = array_of_arrays_to_it_view_v21(should)
is_it = array_of_arrays_to_it_view_v21(is)

del = find_it_view_v21_to_delete(should_it,is_it)
add = find_it_view_v21_to_create(should_it,is_it)

puts "del:"
puts del.inspect
puts "add:"
puts add.inspect
