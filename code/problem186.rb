
class LaggedFibonacci
	def lagged
		return enum_for(:lagged) if not block_given?
		queue = Array.new
		for i in 1..55
			x = (100003 - 200003*i + 300007*i**3) % 1000000
			queue << x
			yield x
		end
		loop do
			x = (queue[31] + queue[0]) % 1000000
			queue.shift
			queue << x
			yield x
		end
	end
end

# Disjoint-set / Union-Find
class Nodes
	attr_accessor :nodes
	def initialize
		@sizes = [1] * 1000000
		@parents = [*0..1000000]
	end

	def find x
		 @parents[x] = find(@parents[x]) if @parents[x] != x
		 @parents[x]
	end

	def union x, y
		node_x = find x
		node_y = find y
		return if node_x == node_y
		@parents[node_x] = node_y
		@sizes[node_y] += @sizes[node_x]
	end

	def size(x)
		@sizes[find(x)]
	end

end

l = LaggedFibonacci.new.lagged
nodes = Nodes.new
i = 0

while nodes.size(524287) < 990000
	caller = l.next
	called = l.next
	next if caller == called
	nodes.union(caller, called)
	i += 1

	puts i if i % 100000 == 0
end

puts i
