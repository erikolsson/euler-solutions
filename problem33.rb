
def greatest_common_divisor (a, b)
	# Euclid's Algorithm
	while b != 0
		t = b
		b = a % b
		a = t
	end

	return a
end

totalNum = 1
totalDen = 1

(10..99).each do |a|
	(a+1..99).each do |b|
		next if a.to_s[1] != b.to_s[0]

		candidate_num = a.to_s[0].to_i
		candidate_den = b.to_s[1].to_i
		
		next if a.to_s[0] != candidate_num.to_s[0]
		next if b.to_s[1] != candidate_den.to_s[0]

		gcd1 = greatest_common_divisor(a, b)
		gcd2 = greatest_common_divisor(candidate_num, candidate_den)

		c = a / gcd1
		d = b / gcd1

		e = candidate_num / gcd2
		f = candidate_den / gcd2
		
		next if c != e
		next if d != f

		puts "#{a} #{b} #{candidate_num} #{candidate_den}"
		
		totalNum *= a
		totalDen *= b
		
	end
end

gcd = greatest_common_divisor(totalNum, totalDen)
a = totalNum / gcd
b = totalDen / gcd

puts "#{a} / #{b}"