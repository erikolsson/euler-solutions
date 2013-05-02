
class Prime
	def initialize(limit)
		puts "Creating prime db with limit: #{limit}"
		@sieve = Hash.new
		@limit = limit
		
		n = 4
		while n <= limit
			@sieve[n] = true
			n += 2
		end

		n = 3
		cross_limit = Math.sqrt(limit)
		while n <= cross_limit
			if !@sieve[n]
				m = n*n
				while m <= limit
					@sieve[m] = true
					m += 2 * n
				end
			end
			n += 2
		end
		@limit = limit
	end

	def is_prime(number)
		raise ArgumentError.new('Number is too big. Set limit higher.') if number > @limit
		return false if number <= 1
		return @sieve[number] != true
	end
end
