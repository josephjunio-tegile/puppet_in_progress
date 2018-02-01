require "tegile-api"

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


##Find what to add
def add(should,is)
    matches_found = []
    should.each do |sub_array1|
        is.each do |sub_array2| 
            if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
                # puts "match found for #{sub_array1}"
                matches_found << sub_array1
            end
        end
    end
    missing = should - matches_found
    if missing.length != 0
        puts "add #{missing}"
    end  
end

##Find what to remove
def remove(should,is)
    matches_found = []
    is.each do |sub_array1|
        should.each do |sub_array2| 
            if sub_array1.host_group_name + sub_array1.target_group_name == sub_array2.host_group_name + sub_array2.target_group_name
                # puts "match found for #{sub_array1}"
                matches_found << sub_array1
            end
        end
    end
    extra = is - matches_found
    if extra.length != 0
        puts "remove #{extra}"
    end 
end

is = [["ig1", "tg1", 1, false],["ig2", "tg2", 2, false],["ig3", "tg3", 3, false]]
should = [["ig1", "tg1", 1, false],["ig4", "tg4", 4, false],["ig2", "tg2", 2, false],["ig3", "tg3", -1, false]]

is_simple =  [["1","1"],["2","2"],["3","3"]]
should_simple = [["1","1"],["2","2"]]

is_class = array_of_arrays_to_it_view_v21(is)
should_class = array_of_arrays_to_it_view_v21(should)


add(should_class,is_class)
remove(should_class,is_class)