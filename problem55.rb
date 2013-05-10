
def lychrel(n, level)
	return -1 if level > 50
	candidate = n + n.to_s.reverse.to_i
	return level - 1 if candidate.to_s == candidate.to_s.reverse
	lychrel(candidate, level + 1)
end

total = 0
for i in 1..9999
	total += 1 if lychrel(i, 1) == -1
end

puts "Total: #{total}"