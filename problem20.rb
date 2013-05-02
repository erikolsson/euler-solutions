total = (1..100).inject(:*).to_s.split(//).map{|c| c.to_i}.inject(:+)
puts "Total sum: #{total}"