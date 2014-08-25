
def amicable_sum(n)
	divisor = n / 2
	sum = 0
	while divisor > 0
		sum += divisor if n % divisor == 0
		divisor -= 1
	end
	sum
end

def get_amicable_sum(n, cache)
	return cache[n] if cache[n]
	sum = amicable_sum(n)
	cache[n] = sum
	sum
end

cache = Hash.new
numbers = Array.new

for a in 1..9999
	da = get_amicable_sum(a, cache)
	next if da < a

	for b in (a+1)..9999
		db = get_amicable_sum(b, cache)
		if da == b && db == a
			numbers << a
			numbers << b
		end
	end
end

sum = numbers.inject(:+)
puts "Sum: #{sum}"