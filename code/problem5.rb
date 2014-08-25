current = 20

loop do
	current = current + 20
	not_divisible = false	
	i = 19
	while i > 10
		if current % i != 0
			not_divisible = true;
			break
		end
		i-=1
	end
	next if not_divisible
	break
end

puts "The smallest number divisible by the numbers 1-20 is #{current}"
