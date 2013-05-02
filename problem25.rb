target = 10**999
current, first, second = 1, 0, 1

loop do
	fibonacci = first + second
	first, second = second, fibonacci
	current += 1
	break if fibonacci >= target
end

puts "The first fibonacci containing 1000 digits is #{current}"