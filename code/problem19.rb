@months_normal = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
@months_leap = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def is_leap_year (year)
	return false if year % 4 != 0
	return false if year % 1000 == 0 unless year % 400 == 0
	true
end

iter_day = 0
count = 0

(1..365).each do
	iter_day += 1
	iter_day = iter_day % 7
end

(1901..2000).each do |year|
	if is_leap_year(year)
		months = @months_leap
	else
		months = @months_normal
	end
	
	months.each do |month_length|
		(1..month_length).each do |d|
			count += 1 if iter_day == 6 && d == 1
			iter_day += 1
			iter_day %= 7
		end
	end
end

puts "Number of sundays that fell on the 1st of the month between 1901-2000: #{count}"