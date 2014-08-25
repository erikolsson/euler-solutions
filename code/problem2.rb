sum,a, b = 0, 0, 1

while a + b < 4_000_000
	f = a + b
	sum += f if f % 2 == 0
	a,b = b,f
end

puts sum