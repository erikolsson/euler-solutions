require './prime'
@primes = Prime.new(1000000)

def number_of_digits(n)
	digits = 0
	while n > 0 do
		n /= 10
		digits += 1
	end
	digits
end

def right_to_left(number)
	while number > 0 do
		return false if !@primes.is_prime (number)
		number /= 10
	end
	true
end

def left_to_right(number)
	digits = number_of_digits(number)
	while digits > 0
		return false if !@primes.is_prime(number % 10**digits)
		digits -= 1
	end
	true
end

sum = 0
count = 0

i = 11
while count < 11 do
	if right_to_left(i) and left_to_right(i)
		sum += i
		count += 1
		puts i
	end
	i += 1
end

puts "Total sum: #{sum}"