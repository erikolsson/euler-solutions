def greatest_common_divisor(a,b)
	while b != 0
		t = b
		b = a % b
		a = t
	end
	a
end

cache = Hash.new
for m in 1..1000
	for n in (m+1)..1000
		# vi behöver bara bry oss om de fall då n+m är ojamna och då gcd (m,n) är 1.
		next if (n + m) % 2 != 1 or greatest_common_divisor(n,m) != 1

		a = n * n - m * m
		b = 2 * n * m
		c = m*m + n*n
		length = a+b+c
		i = length
		while i < 1500000
			cache[i] ||= 0
			cache[i] += 1
			i += length
		end
	end
end

total = 0
for i in 1...1500000
	total += 1 if cache[i] == 1
end

puts total