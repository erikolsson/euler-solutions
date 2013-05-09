require 'prime'

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

numbers = "1234567"

largest = 0
for i in 1..5040
	largest = numbers.to_i if Prime.instance.prime?numbers.to_i
	next_lexicographic(numbers)
end

puts largest