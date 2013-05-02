nodes = "-,16,12,21,-,-,-
16,-,-,17,20,-,-
12,-,-,28,-,31,-
21,17,28,-,18,19,23
-,20,-,18,-,-,11
-,-,31,19,-,-,27
-,-,-,23,11,27,-".split("\n").map{|val| val.split(",").map{|val| val.to_i}}

def print_nodes(nodes)
	nodes.each do |row|
		row.each do |c|
			print c
			print "\t"
		end
		print "\n"
	end

	nodes.each do |row|
		print row.max
		print "\t"
	end
	print "\n"
	print "\n"
end

print_nodes(nodes)
nodes2 = Array.new(nodes.length) {Array.new(nodes.length, 0)}
nodes3 = Array.new(nodes.length) {Array.new(nodes.length, 0)}

for y in 0...nodes.length
	min = Float::INFINITY
	for x in 0...nodes.length
		next if nodes[y][x] == 0
		min = nodes[y][x] if nodes[y][x] < min
	end

	for x in 0...nodes.length
		if nodes[y][x] != min
			nodes2[y][x] = 0 
		else
			nodes2[y][x] = nodes[y][x]
		end
	end
end

for x in 0...nodes.length
	min = Float::INFINITY
	for y in 0...nodes.length
		next if nodes[y][x] == 0
		min = nodes[y][x] if nodes[y][x] < min
	end

	for y in 0...nodes.length
		if nodes[y][x] != min
			nodes3[y][x] = 0 
		else
			nodes3[y][x] = nodes[y][x]
		end
	end
end

print_nodes(nodes2)
print_nodes(nodes3)