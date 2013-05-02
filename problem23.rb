def sum_divisors(n)
	limit = Math.sqrt(n)
	sum = 1
	for x in 2..limit
		if n % x == 0
			sum += x
			sum += n/x if n/x != limit
		end
	end
	sum
end

abundant = Array.new
for i in 1..30000
	val = sum_divisors(i)
	abundant << i if val > i
end

sums = Hash.new

abundant.each do |a|
	abundant.each do |b|
		v = a + b
		sums[v] = true
	end
end

puts "Total: #{abundant.length} abundant numbers"

sum = 0
for i in 1..30000
	sum += i if !sums[i]
end

puts sum