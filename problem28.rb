width = 1001
target = width * width

i = 1
di = 2
total = 1

while i < target
	4.times do
		i += di
		total += i
	end
	di += 2
end

puts "The sum of the numbers in the diagonals of a square with #{width} width: #{total}"