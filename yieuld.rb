
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

class Node
	attr_accessor :parent
	attr_accessor :rank
	attr_accessor :size

	def initialize
		@parent = self
		@rank = 0
		@size = 1
	end
end
# Disjoint-set / Union-Find
class Nodes
	attr_accessor :nodes
	def initialize
		@nodes = Array.new(1000000) {Node.new}
	end

	def find(i)
		node = @nodes[i]
		return node if node.parent == node

		temp = node
		while temp.parent != temp
			temp = temp.parent
		end

		node.parent = temp
		temp.size += node.size
		node.size = 0
		temp
	end

	def union(i, j)
		x = find(i)
		y = find(j)
		if (x == y)
			return;
		elsif x.rank < y.rank
			x.parent = y
			y.size += x.size
			x.size = 0
		elsif (x.rank > y.rank)
			y.parent = x
			x.size += y.size
			y.size = 0
		else
			x.parent = y
			y.rank += 1
			y.size += x.size
			x.size = 0
		end
	end

	def size(i)
		node = @nodes[i]
		while node.parent != node
			node = node.parent
		end
		node.size
	end

end

l = LaggedFibonacci.new.lagged
nodes = Nodes.new
i = 0

while nodes.size(524287) < 990000
	caller = l.next
	called = l.next
	next if caller == called
	puts i if i % 100000 == 0
	nodes.union(caller, called)
	i += 1
end

puts i
