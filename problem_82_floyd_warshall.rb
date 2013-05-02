matrix = File.read("./problem81_data.txt").split("\n").map{|row| row.split(",").map{|val| val.to_i}}.transpose
matrix2 = "131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331".split("\n").map {|row| row.split(" ").map{|val| val.to_i}}.transpose

width = matrix.length
matrix_count = width * width

class Vertex
	attr_accessor :value	
end

vertices = Array.new(width * width){Vertex.new}
distances = Hash.new

vertices.each do |v1|
	distances[v1] = Hash.new
	distances[v1][v1] = 0
	vertices.each do |v2|
		#distances[v1][v2] = Float::INFINITY
	end
end


for x in 0...width
	for y in 0...width
		
		v1 = vertices[x + y * width]
		distances[v1][v1] = matrix[x][y]
		if x < width - 1
			v2 = vertices[x + 1 + y * width]
			distances[v1][v2] = matrix[x+1][y]
		end

		if y > 0
			v2 = vertices[x + (y - 1)* width]
			distances[v1][v2] = matrix[x][y-1]
		end

		if y < width - 1
			v2 = vertices[x + (y + 1)* width]
			distances[v1][v2] = matrix[x][y+1]
		end
	end
end


vertices.each do |k|
	vertices.each do |i|
		vertices.each do |j|
			ik = distances[i][k] ||= Float::INFINITY
			kj = distances[k][j] ||= Float::INFINITY
			ij = distances[i][j] ||= Float::INFINITY

			distances[i][j] = distances[i][k] + distances[k][j] if distances[i][k] + distances[k][j] < distances[i][j]
		end
	end
end

min = Float::INFINITY
for y in 0...width
	v1 = vertices[y * width]
	for y2 in 0...width
		v2 = vertices[width - 1 + y2 * width]
		min = distances[v1][v2] + distances[v1][v1] if distances[v1][v2] + distances[v1][v1] < min
	end
end

puts "min: #{min}"