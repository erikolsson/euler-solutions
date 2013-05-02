def partitions(number)
	ways = Array.new(number + 1, 0)
	ways[0] = 1
	for i in 1..number-1
		for j in i..number
			ways[j] += ways[j-i]
		end
	end
	ways[number]
end

puts partitions(100)