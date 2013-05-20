str = ""
i = 1
while str.length <= 1000000
	str << i.to_s
	i += 1
end

product = str[0].to_i
pos = 10

for i in 1..6
	product *= str[pos-1].to_i
	pos *= 10
end 

puts "Answer: #{product}"