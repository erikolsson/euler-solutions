
def is_pandigital(number)
	return number.chars.sort.join == "123456789"
end

products = Array.new
for a in 1..100
	puts a if a % 100000 == 0
	for b in 1..10000
		product = a * b
		number = "#{a}#{b}#{product}"
		next if number.length > 9
		if is_pandigital(number)
			products << product
		end
	end
end

puts products.uniq.inject(:+)