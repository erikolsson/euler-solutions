
numbers = Array.new

(1..999999).each do |n|
	n_str = n.to_s

	total = 0
	n_str.each_char do |n_c|
		total = total + (n_c.to_i)**5
	end
	
	numbers << n if total == n and n > 1
end


total = numbers.inject(:+)

puts total