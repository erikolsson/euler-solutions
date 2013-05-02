
def number_of_solutions (perimeter)
	total = 0
	(1..(perimeter/2)).each do |a|
		(1..1000-a).each do |b|
			c2 = a*a+b*b
			total += 1 if c2 == (perimeter-a-b) * (perimeter-a-b)
		end
	end

	total
end

most_solutions = 0
greatest_perimeter = 0
(1..1000).each do |p|
	candidate = number_of_solutions (p)
	if candidate > most_solutions
		most_solutions = candidate
		greatest_perimeter = p
	end
end

puts "The perimeter with the most solutions was #{greatest_perimeter}"