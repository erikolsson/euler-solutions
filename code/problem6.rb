limit = 100
sum1 = (1..limit).to_a.map{|x| x*x}.inject(:+)
sum2 = (1..limit).to_a.inject(:+)**2

diff = sum2 - sum1

puts "Answer: #{diff}"
