matrix = File.read("./problem81_data.txt").split("\n").map{|row| row.split(",").map{|val| val.to_i}}.transpose
matrix2 = "131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331".split("\n").map {|row| row.split(" ").map{|val| val.to_i}}.transpose

width = matrix.length


class Vertex
	attr_accessor :prev
	attr_accessor :adjacent
	attr_accessor :distance
	attr_accessor :weight
	def initialize
		@adjacent = Array.new
		@distance = Float::INFINITY
	end

	def add_adjacent (vertex)
		@adjacent << vertex if !@adjacent.include?(vertex)
	end
end

class Graph
	attr_accessor :vertices
	def initialize
		@vertices = Array.new(80*80) {Vertex.new}
	end

	def key(x,y)
		y * 80 + x
	end

	def add_edge(x1, y1, x2, y2)
		from = @vertices[key(x1,y1)]
		to = @vertices[key(x2,y2)]
		from.add_adjacent(to)
	end

	def set_vertex_weight(x, y, weight)
		vertex = @vertices[key(x, y)]
		vertex.weight = weight
	end

	def vertex(x, y)
		@vertices[key(x,y)]
	end

	def dijkstra (source, target)
		queue = Array.new
		queue.each {|vertex| vertex.distance = Float::INFINITY}
		target.prev = nil

		source.distance = source.weight
		queue << source
		until queue.empty?
			u = queue.min_by {|vertex| vertex.distance}
			queue.delete(u)

			break if target == u

			u.adjacent.each do |v|
				alt = u.distance + v.weight
				if alt < v.distance
					v.distance = alt
					v.prev = u
					queue << v
				end
			end
		end

		length = 0
		target.distance
	end
end

graph = Graph.new

for x in 0...width
	for y in 0...width
		graph.set_vertex_weight(x, y, matrix[x][y])

		if x < width - 1
			graph.add_edge(x, y, x + 1, y)
		end

		if x > 0
			graph.add_edge(x, y, x - 1, y)
		end

		if y > 0
			graph.add_edge(x, y, x, y - 1)
		end

		if y < width - 1
			graph.add_edge(x, y, x, y + 1)
		end
	end
end

source = graph.vertex(0,0)
target = graph.vertex(width-1, width-1)
val = graph.dijkstra(source, target)
puts "Found: #{val}"
