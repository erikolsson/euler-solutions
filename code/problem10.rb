require './prime'
primes = Prime.new(2000000)

total = 2
n = 3

while n < 2000000
	total += n if primes.is_prime(n)
	n+=2
end

puts "The total sum of all primes below two million is: #{total}"