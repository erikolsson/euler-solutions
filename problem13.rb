total = File.read("./problem13_data.txt").split("\n").map!{|n| n.to_i}.inject(:+).to_s
puts "The first ten digits of the sum: #{total[0..9]}"