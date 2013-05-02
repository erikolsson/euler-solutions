
def number_of_ways(n, remainder, inverses)
	#puts remainder
	if remainder == 0
		puts "Found SUM!"
		return 1
	end

	if remainder < 0
		#puts "too small!"
		return 0
	end

	c = 0
	for i in n...inverses.length
		new_remainder = remainder - inverses[i]
		#next if new_remainder < 0
		c += number_of_ways(i+1, new_remainder, inverses);
	end
	c
end

half_lcm = lcm / 2

inverses = Array.new
for i in 2..50
	next if i == 13
	next if i == 11
	next if i == 17
	next if i == 19
	next if i == 21
	next if i == 22
	next if i == 23
	next if i == 26
	next if i == 29
	next if i == 31
	next if i == 33
	next if i == 34
	puts i
	inverses << (lcm / (i*i))
end
puts inverses
puts number_of_ways(0, half_lcm, inverses)
