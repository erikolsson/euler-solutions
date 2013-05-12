values = File.read("./problem99_data.txt").split("\n").map{|line| line.split(",").map{|v| v.to_i}}

largest = 0.0
largest_line = 0
i = 1

values.each do |line|
	base = line[0]
	exp = line[1]
	digits = exp * Math.log(base)
	if digits > largest
		largest_line = i
		largest = digits
	end
	i+=1
end

puts "Line: #{largest_line}"