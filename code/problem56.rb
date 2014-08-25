
max = 0
max_sum = 0

def digit_sum(n)
	total = 0
	while n > 0
		total += n%10
		n /= 10
	end
	total
end

99.downto(1) do |a|
	99.downto(1) do |b|
		digits = (a * Math.log(b, 10)).ceil
		break if digits * 9 < max_sum
		total = digit_sum(a**b)
		if total > max_sum
			max_sum = total
		end
	end
end

puts max_sum