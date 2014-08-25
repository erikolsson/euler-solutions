def is_the_one(n)
	return false if n % 10 != 0
	n /= 10
	i = 9
	while n > 0
		n /= 10
		last_digit = n % 10
		return false if last_digit != i
		n /= 10
		i -= 1
	end
	true
end

i = Math.sqrt(1929394959697989990).to_i
val = 1
puts i**2
while val > 0
	val = i**2
	puts i if i % 1000000 == 0

	if is_the_one(val)
		puts "FOUND!" 
		puts i
		break
	end

	i -= 1
end