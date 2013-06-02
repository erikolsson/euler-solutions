@values = Hash.new
@values["I"] = 1
@values["V"] = 5
@values["X"] = 10
@values["L"] = 50
@values["C"] = 100
@values["D"] = 500
@values["M"] = 1000

@romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
@arabic = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
 
def decode(r)
	r = r.dup
	total = 0
	previous = 0

	until r.empty?
		n = @values[r[r.length-1]]
		r = r[0..-2]
		
		if n >= previous
			total += n
		else
			total -= n
		end

		previous = n
	end

	total
end

def shortest(n)
	str = ""
	for i in 0..@arabic.length-1
		while n >= @arabic[i]	
			str << @romans[i]
			n -= @arabic[i]
		end
	end
	str
end

input_values = File.read("./problem89_data.txt").split("\n")

total_input_chars = 0
total_output_chars = 0

input_values.each do |row|
	total_input_chars += row.length
	arabic = decode(row)
	total_output_chars += shortest(arabic).length
end

puts total_input_chars - total_output_chars








