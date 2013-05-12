values = File.read("./problem99_data.txt").split("\n").map{|line| line.split(",").map{|v| v.to_i}}

largest = values.each_with_index.map {|line, i|
	base, exp = line[0], line[1]
	[exp * Math.log(base), i+1]
}.max[1]

puts "Largest line: #{largest}"
