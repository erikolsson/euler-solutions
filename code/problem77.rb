require './prime'

def partitions(number, primes)
	ways = Array.new(number + 1, 0)
	ways[0] = 1
	for i in 0..primes.length - 1
		for j in primes[i]..number
			ways[j] += ways[j-primes[i]]
		end
	end

	ways[number]
end

prime_db = Prime.new(100000)

primes = Array.new
for i in 2..100000
	primes << i if prime_db.is_prime(i)
end

i = 1
loop do
	ways = partitions(i, primes)
	break if ways >= 5000
	i += 1
end

puts "Answer: #{i}"
