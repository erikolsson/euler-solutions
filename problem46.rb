
require 'prime'

numbers = Hash.new
for i in 1..10000
	next if !Prime.instance.prime?i
	for j in 1..100
		numbers[i + 2*(j**2)] = true
	end
end

i = 1
loop do 
	i += 2
	next if Prime.instance.prime?i
	next if numbers[i] == true
	puts i
	break
end


