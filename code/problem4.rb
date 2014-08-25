def is_palindrome(number)
	n = number
	rev = 0
	while(number > 0)
		dig = number % 10
		rev = rev * 10 + dig
		number = number / 10
	end
	return (rev == n)
end

largest = 0

(1..999).each do |n1|
	(n1..999).each do |n2|
		product = n1 * n2
		next if product < largest
		largest = product if is_palindrome(product)
	end
end

puts "The largest palindromic number made from two 3-digit numbers is #{largest}"
