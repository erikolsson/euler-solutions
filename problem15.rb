def walk (x, y, width, path_counts)
	return 0 if x > width
	return 0 if y > width
	return 1 if x == width && y == width
	
	key = "#{x}-#{y}"
	return path_counts[key] if path_counts[key] != nil

	pc = walk(x + 1, y, width, path_counts)
	pc += walk(x, y + 1, width, path_counts)
	path_counts[key] = pc
	return pc
end

path_counts = Hash.new
count = walk(0,0, 20, path_counts)

puts "Total number of paths: #{count}"