pentagonal = Hash.new
hexagonal = Hash.new

for i in 1..100000
	pentagonal[i * (3*i - 1) / 2] = true
	hexagonal[i * (2*i -1)] = true
end

#(40755)
i = 286
loop do
	triangle = i * (i+1) / 2
	if pentagonal[triangle] and hexagonal[triangle]
		puts triangle
		break
	end
	i += 1
end