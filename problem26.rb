
def evaluate(n)
	visited = Hash.new
	cycle = 0
	num = 1
	while true 
		remainder = num % n
		break if visited[remainder]
		visited[remainder] = true
		num = (10 * remainder)
		cycle += 1
	end
	cycle
end

longest = 0
longest_num = -1
for i in 1..1000
	val = evaluate(i)
	if val > longest
		longest = val
		longest_num = i
	end
end


puts longest_num
