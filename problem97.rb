exponent = 7830457
mod = 10 ** 10
sum = 1
for i in 1..exponent
	sum = (sum * 2) % mod
end

puts (28433 * sum + 1) % mod