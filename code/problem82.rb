matrix = File.read("./problem81_data.txt").split("\n").map{|row| row.split(",").map{|val| val.to_i}}.transpose
matrix2 = "131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331".split("\n").map {|row| row.split(" ").map{|val| val.to_i}}.transpose

width = matrix.length

b = Array.new(width)

for i in 0...width
	b[i] = matrix[width - 1][i]
end

start_position = width - 2

start_position.downto(0) do |i|
	
	b[0] += matrix[i][0]

	for j in 1...width
		b[j] = [b[j-1] + matrix[i][j], b[j] + matrix[i][j]].min
	end

	start_position.downto(0) do |j|
		b[j] = [b[j], b[j+1] + matrix[i][j]].min
	end
end

puts b.min