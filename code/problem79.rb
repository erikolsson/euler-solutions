
attempts = File.read("./keylog.txt").split("\n").uniq

class Vertex
	attr_accessor :next
	attr_accessor :value
	def initialize
		@next = Array.new
	end

end

digits = Hash.new

attempts.each do |attempt|
	attempt.each_char do |c|
		digits[c] ||= Vertex.new
		digits[c].value ||= c
	end

	for i in 0...attempt.length-1
		v1 = digits[attempt[i]]
		v2 = digits[attempt[i+1]]
		v1.next << v2
	end
end

queue = digits.values
answer = Array.new

until queue.empty?
	d = queue.min_by{|v| v.next.length}
	answer.insert(0, d)
	for vertex in queue
		vertex.next.delete(d) if vertex.next.include?(d)
	end
	queue.delete(d)
end

str = ""
answer.each do |a|
	str += a.value
end

puts str