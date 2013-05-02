
def factorial(n)
	if n == 0
		1
	else
		n * factorial(n-1)
	end
end

def ncr(n, r)
	factorial(n) / (factorial(r) * factorial(n-r))
end

total = 0
for n in 1..100
	for r in 1..n
		total += 1 if ncr(n, r) > 1000000
	end
end

puts total