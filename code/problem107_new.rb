nodes = File.read("./network.txt").split("\n").map{|val| val.split(",").map{|val| val.to_i}}

class Edge
	attr_accessor :from
	attr_accessor :to
	attr_accessor :weight

	def initialize(from, to, weight)
		@from = from
		@to = to
		@weight = weight
	end
end

edges = Array.new

for x in 0...nodes.length
	for y in 0...nodes.length
		next if nodes[x][y] == 0
		edge = Edge.new(x, y, nodes[x][y])
		edges << edge
	end
end

total1 = 0
edges.each {|edge| total1 += edge.weight}
total1 /= 2
puts "Before: #{total1}"

v = Array.new
edge = edges.min_by{|edge| edge.weight}
v << edge

edges.delete edge
puts nodes.length

while v.length < nodes.length
	edge = edges.select{|e1| v.any?{|e2| e2.to == e1.from || e2.from == e1.from}}.reject{|e1| v.any?{|e2| e1.to == e2.to || e1.to == e2.from}}.min_by{|e| e.weight}
	break if !edge
	v << edge
	edges.delete edge
end

total = 0
v.each {|edge| total += edge.weight}
puts "After: #{total}"
puts "Saved: #{total1-total}"