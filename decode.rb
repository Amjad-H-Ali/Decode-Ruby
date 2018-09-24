p "Decode!"

# Function takes in string of digits and 
# k representing current portion of string being evaluated
# Returns number of possible ways to decode string
def helper data, k, store
	# Exit code: When "" return 1
	if k == 0
		return 1;	
	end

	# When current first char is '0', no way to decode
	s = data.length - k
	if data[s] == '0'
		return 0;
	end
	
	# If we found result before, return it and prevent rendundant work
	if store[k]
		return store[k]
	end	

	# Ex: result of "12345" equals "2345" + "345"(if two digit number less than or equal to 26)
	result = helper data, k - 1, store
	
	# If two digit number less than or equal to 26
	if k >= 2 and (data.slice(s, 2)).to_i <= 26
		result += helper data, k - 2, store
	end	

	# Store result before returning it
	store[k] = result

	# Return result
	result	

end	




# Function to take in digits in the form of a string as argument
# and passes to helper function
def num_of_ways data
	# To store data and prevent redundant computation
	store = {}

	helper data, data.length, store
end	

p num_of_ways "123"  # 3
p num_of_ways "023"  # 0
p num_of_ways "1203" # 1
p num_of_ways ""     # 1
p num_of_ways "2723" # 2
p num_of_ways "12"   # 2





