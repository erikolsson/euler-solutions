matrix = File.read("./problem81_data.txt").split("\n").map{|row| row.split(",").map{|val| val.to_i}}.transpose

width = matrix.length
b = Array.new(width) {Array.new(width) {0}}

for x in 0...width
	for y in 0...width
		values = Array.new
		values << b[x-1][y] if x > 0
		values << b[x][y-1] if y > 0
		values << 0 if x == 0 && y == 0
		m = matrix[x][y] + values.min
		b[x][y] = m
	end
end

puts "#{b[width-1][width-1]}"