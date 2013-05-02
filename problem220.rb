def string_rewrite str
	a = "aRbFR"
	b = "LFaLB"
	res = ""
	index = 0

	str.each_char do |c|
		if c == "a"
			res[index] = a
			index += a.length
		elsif c == "b"
			res[index] = b
			index += b.length
		else
			res[index] = c
			index += 1
		end
	end
	res
end

d = "Fa"

i = 0
50.times do
	d = string_rewrite(d)
	puts d.length
	puts i
	i += 1
end

puts d