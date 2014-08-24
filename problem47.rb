require 'mathn'

i = 1
while true
	consecutive = (i..i+3).to_a
	break if consecutive.all? {|n| n.prime_division.length == 4}
	i += 1
end

puts "The first number is: #{i}"