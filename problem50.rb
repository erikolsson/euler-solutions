
require 'prime'

primes = Array.new
for i in 1..10000
	primes << i if Prime.instance.prime?i
end

limit = 1000000
longest_consecutive = 0
longest_number = 0
for a in 1...primes.length
	sum = 0
	consecutive = 0
	for b in a...primes.length
		sum += primes[b]
		break if sum >= limit
		consecutive += 1
		if Prime.instance.prime?sum and longest_consecutive < consecutive
			longest_number = sum
			longest_consecutive = consecutive 
		end
	end
end

puts "The longest sum of consecutive primes < 1000000 that adds to a prime contains #{longest_consecutive} terms. Answer: #{longest_number}."
