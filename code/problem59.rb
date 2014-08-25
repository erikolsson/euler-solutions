
chars = File.read("./problem59_data.txt").split(",")

def decrypt_using_key(a,b,c, chars)
	s = ""
	keys = [a, b, c]

	i = 0
	chars.each do |char|
		xor = char.to_i
		nc = keys[i]^xor
		s = s + nc.chr
		i = i +1
		i %= keys.length
	end
	return s
end


def count_ascii(str)
	str.split(//).map{|c| c.ord}.inject(:+)
end

(97..122).each do |a|
	(97..122).each do |b|
		(97..122).each do |c|
			str = decrypt_using_key(a,b,c, chars)
			if str.scan("Word").size > 1
				puts "-- Decrypted string--"
				puts str
				puts "Answer: #{count_ascii(str)}"
				exit
			end
		end
	end
end

