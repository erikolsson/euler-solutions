
digits = "0123456789".split(//).map{|d| d.to_i}

def getNext (digits)
	# Dijkstra Lexicographic
	
	i = digits.length - 1
	while digits[i-1] >= digits[i]
		i = i - 1
	end

	j = digits.length

	while digits[j-1] <= digits[i-1]
		j = j - 1
	end

	digits[i-1], digits[j-1] = digits[j-1], digits[i-1]
	
	i += 1
	j = digits.length

	while i < j
		digits[i-1], digits[j-1] = digits[j-1], digits[i-1]	
		i += 1
		j -= 1
	end

	digits
end

999999.times do 
	digits = getNext(digits)
end

puts "Answer: #{digits.join}"