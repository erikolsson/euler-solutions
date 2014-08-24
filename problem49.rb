require 'prime'

Prime.each do |start|
	next if start == 1487
	numbers = Array.new(3) {|i| start + 3330 * i}
	next if not numbers.all? {|n| Prime.prime?(n)}
	permutations = numbers[0].to_s.chars.to_a.permutation.map(&:join)
	next if not numbers.all? {|n| permutations.include?n.to_s}
	puts "Found answer: #{numbers.join()}"
	break
end
