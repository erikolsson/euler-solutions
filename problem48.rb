
ten_digits = 10000000000
total = 0
for i in 1..1000
	total += i**i % ten_digits
	total %= ten_digits
end

puts total