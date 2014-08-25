class LaggedFibonacci
	def lagged
		return enum_for(:lagged) if not block_given?
		queue = Array.new
		for i in 1..55
			x = (100003 - 200003*i + 300007*i**3) % 1000000 - 500000
			queue << x
			yield x
		end
		loop do
			x = (queue[31] + queue[0]) % 1000000 - 500000
			queue.shift
			queue << x
			yield x
		end
	end
end

class Array
  def diagonals
    [self, self.map(&:reverse)].inject([]) do |all_diags, matrix|
      ((-matrix.count + 1)..matrix.first.count).each do |offet_index|
        diagonal = []
        (matrix.count).times do |row_index|
          col_index = offet_index + row_index
          diagonal << matrix[row_index][col_index] if col_index >= 0
        end
        all_diags << diagonal.compact if diagonal.compact.count > 1
      end
      all_diags
    end
  end
end

def max(a, b)
	return a if a > b
	b
end

def max_subarray(a)
	max_ending_here = max_so_far = 0
    a.each do |x|
        max_ending_here = max(x, max(0, max_ending_here + x))
        max_so_far = max(max_so_far, max_ending_here)
    end
    return max_so_far
end

def max_horizontal(values)
	max_value = 0
	values.each do |row|
		sub_array = Array.new
		row.each do |v|
			sub_array << v
		end
		max_value = max(max_value, max_subarray(sub_array))
	end

	max_value
end

def max_vertical(values)
	max_value = 0
	for x in 0...values.length
		sub_array = Array.new
		for y in 0...values.length
			sub_array << values[y][x]
		end
		max_value = max(max_value, max_subarray(sub_array))
	end
	max_value
end

def max_diagonals(values)
	diagonals = values.diagonals
	max_value = 0
	diagonals.each do |diagonal|
		max_value = max(max_value, max_subarray(diagonal))
	end
	max_value
end


values = Array.new
l = LaggedFibonacci.new.lagged
for i in 0...2000
	row = Array.new
	for j in 0...2000
		v = l.next
		row << v
	end
	values << row
end

puts "Got values"
max_val = 0
max_val = max(max_horizontal(values), max_val)
puts "Got horizontal"
max_val = max(max_vertical(values), max_val)
puts "Got vertical"
max_val = max(max_diagonals(values), max_val)

puts "#{max_val}"



