
def is_left_of_line(x1, y1, x2, y2)
	if (x2-x1) * (-y1) - (y2 - y1) * (-x1) > 0
		true
	else
		false
	end
end

def triangle_contains_origin(triangle)
	coords = triangle.split(",").map{|c| c.to_i}
	is_left = is_left_of_line(coords[4], coords[5], coords[0], coords[1])
	for i in 0..1
		return false if is_left_of_line(coords[i*2], coords[i*2+1], coords[(i+1)*2], coords[(i+1)*2+1]) != is_left
	end	
	true
end

triangles = File.read("./problem102_data.txt").split("\n")

total = 0
triangles.each do |triangle|
	total += 1 if triangle_contains_origin(triangle)
end

puts total