

def count_digits(n)
	dig = 0
	while n > 0
		n /= 10
		dig += 1
	end
	dig
end

total = 0
for i in 1..20
	for p in 1..25
		val = i**p
		dig = count_digits(val)
		if dig == p
			puts val
			total += 1
		elsif dig > p
			break
		end
	end
end

puts total