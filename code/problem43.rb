
def next_lexicographic(numbers)
	i = numbers.length - 1
	while numbers[i-1] >= numbers[i]
		i -= 1
	end

	j = numbers.length
	while numbers[j-1] <= numbers[i-1]
		j -= 1
	end

	numbers[i-1], numbers[j-1] = numbers[j-1], numbers[i-1]
	i += 1
	j = numbers.length

	while i < j
		numbers[i-1], numbers[j-1] = numbers[j-1], numbers[i-1]
		i += 1
		j -= 1
	end
	numbers
end

def divisibility(numbers, divisors)
	i = numbers.length - 1
	while i > 2
		return false if numbers[i-2..i].to_i % divisors[i-3] != 0
		i -= 1
	end
	true
end

divisors = [2,3,5,7,11,13,17]
numbers = "0123456789"
sum = 0
for i in 1..3628800
	
	if divisibility(numbers, divisors) == true
		val = numbers.to_i 
		sum += val
		puts sum
		puts numbers
	end
	next_lexicographic(numbers)
end

puts "Total: #{sum}"