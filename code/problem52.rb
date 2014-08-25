current = 0
done = false

while !done
	current += 1
	n1_str = current.to_s.chars.sort.join
	for i in 2..6
		n2_str = (current * i).to_s.chars.sort.join
		break if n2_str != n1_str
		done = true	if i == 6
	end
end

puts current
