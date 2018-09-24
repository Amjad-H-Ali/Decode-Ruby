p "Decode!"

# Function takes in string of digits and 
# k representing current portion of string being evaluated
def helper data, k
	# Exit code: When "" return 1
	if k == 0
		return 1;	
	end

	# When current first char is '0', no way to decode
	s = data.length - k
	if data[s] == '0'
		return 0;
	end
	
	# Ex: result of "12345" equals "2345" + "345"(if two digit number less than or equal to 26)
	result = helper(data, k - 1)

	# If two digit number less than or equal to 26
	if k >= 2 and (data.slice(s, s + 2)).to_i <= 26
		result += helper(data, k - 2)
	end		

end	




# Function to take in digits in the form of a string as argument
# and passes to helper function
def num_of_ways data

	helper data, data.length
end	