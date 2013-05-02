triangle = File.read("problem67_data.txt").split("\n").map{|v| v.split(" ").map{|v| v.to_i}}

i = triangle.length - 2
while i >= 0
	for j in 0..i
		triangle[i][j] += [triangle[i+1][j], triangle[i+1][j+1]].max
	end
	i -= 1
end

puts triangle[0][0]