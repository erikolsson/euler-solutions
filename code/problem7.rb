require './prime'
primes = Prime.new(800000)

current = 2
count = 0

loop do
	count += 1 if primes.is_prime(current)
	break if count == 10001
	current += 1
end

puts "The 10001st prime is #{current}"