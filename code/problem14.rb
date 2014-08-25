def collatz(n)
	return n / 2 if n % 2 == 0
	3 * n + 1
end

def depth_count(start, depth, cache)
	return 0 if start == 1
	return cache[start] if cache[start]

	next_collatz = collatz(start)
	d = 1 + depth_count(next_collatz, depth, cache)
	cache[next_collatz] = d if !cache[next_collatz]
	d
end

longest = 0
start = 0
cache = Hash.new

(1..1000000).each do |n|
	steps = depth_count(n, 0, cache)
	if steps > longest
		longest = steps
		start = n
	end
end

puts "The longest chain starts with #{start}"