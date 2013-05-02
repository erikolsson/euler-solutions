
names = File.read("./problem22_data.txt").split(",").map{|name| name.tr!('"', '')}.sort

iter = 1
total = 0
names.each do |name|
	score = name.split(//).map{|c| c.ord - 64}.inject(:+) * iter
	total += score
	iter += 1
end

puts total