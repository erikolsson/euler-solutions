def number_of_divisors(number)
	c = 0
	limit = Math.sqrt(number)
	for n in 1..limit
		c += 2 if number % n == 0
	end
	c
end

triangle_number = 0
current = 1

loop do
	triangle_number = triangle_number + current
	current += 1
	break if number_of_divisors(triangle_number) > 500
end

puts "The first number with > 500 divisors is #{triangle_number}"