
sum = 0

for i in 1..1000000
	str_base_ten = i.to_s
	next if str_base_ten != str_base_ten.reverse
	str_base_two = i.to_s(2)
	next if str_base_two != str_base_two.reverse
	sum += i
end

puts sum
