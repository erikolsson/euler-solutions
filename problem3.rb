require './prime'

target = 600851475143
primes = Prime.new(Math.sqrt(target))

largest = 0
for i in 2..Math.sqrt(target)
	if primes.is_prime(i)
		largest = i if target % i == 0
	end
end

puts "The largest prime factor is: #{largest}"