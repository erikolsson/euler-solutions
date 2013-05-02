

(1..500).each do |a|
	(a+1..500).each do |b|
		csq = a * a + b * b
		c = Math.sqrt(csq).to_i
		next if c*c != csq
		if c + b + a == 1000
			puts "#{a} #{b} #{c}" 
			puts "Product: #{a*b*c}"
			exit
		end
	end
end