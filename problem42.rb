words = File.read("./problem42_data.txt").split(",").map {|word| word.tr!("\"", "")}

triangle_numbers = Hash.new
1.upto(50).each{|n| triangle_numbers[(n + 1) * n / 2] = true}

def word_value(word)
	word.each_char.map {|c| c.ord - 64}.inject(:+)
end

triangle_words = 0
words.each do |w|
	triangle_words += 1 if triangle_numbers[word_value(w)] == true
end

puts "Total number of triangle words: #{triangle_words}"
