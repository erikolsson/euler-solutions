require './prime'
primes = Prime.new(1000000)

largest_a = 0
largest_b = 0
largest_consecutive = 0

for a in -999..999
	for b in -999..999
		n = 0
		while true
			val = n*n + a*n + b
			break if val <= 0
			break if !primes.is_prime(val)
			n += 1
		end

		if n > largest_consecutive
			largest_a = a
			largest_b = b
			largest_consecutive = n
		end
	end
end

puts "n2 + #{largest_a}*n + #{largest_b} generated #{largest_consecutive} consecutive primes"

puts "The product of a and b: #{largest_a*largest_b}"