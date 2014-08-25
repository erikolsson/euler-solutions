
agrid = "003020600
900305001
001806400
008102900
700000008
006708200
002609500
800203009
005010300".delete("\n").split(//).map{|val| val.to_i}

all_grids_input = File.read("./problem96_data_sudoku.txt").split("\n")

all_grids = Array.new
i = 0
str = ""
for line in all_grids_input
	i += 1
	next if i == 1
	str += line
	if i == 10
		all_grids << str.split(//).map{|val| val.to_i}
		str = ""
		i = 0
	end
end

def index(x,y)
	return y * 9 + x
end

def row_contains(number, row, grid)
	start = row * 9
	for i in start..start+8
		return true if grid[i] == number
	end
	false
end

def col_contains(number, col, grid)
	col.step(80, 9) do |index|
		return true if grid[index] == number
	end
	false
end

def square_contains(x, y, number, grid)
	start_x = (x / 3) * 3
	start_y = (y / 3) * 3
	for x in start_x...start_x+3
		for y in start_y...start_y+3
			index = index(x, y)
			return true if grid[index] == number
		end
	end
	false
end

def valid_numbers_for(idx, grid, min)
	x = idx % 9
	y = idx / 9
	valid = Array.new
	for i in min..9
		next if row_contains(i, y, grid)
		next if col_contains(i, x, grid)
		next if square_contains(x, y, i, grid)
		valid << i
	end
	valid
end

def solve(grid)
	unchanged = false
	changed = Array.new

	until unchanged
		unchanged = true

		i = grid.index(0)
		
		if i != nil
			p = valid_numbers_for(i, grid, 1)
			if p.size > 0
				grid[i] = p[0]
				changed << i
				unchanged = false
			end
		end

		if unchanged and grid.index(0) != nil
			until !unchanged or changed.size == 0
				i = changed.last
				changed.delete(i)
				current = grid[i]
				grid[i] = 0
				p = valid_numbers_for(i, grid, current + 1)
				if p.size > 0
					grid[i] = p[0]
					changed << i
					unchanged = false
				end
			end
		end
	end

	grid
end

i = 0
for grid in all_grids
#	puts "#{i} #{grid}"
	grid = solve(grid)
	puts "#{i} #{grid}"
	puts "DSAFSFSF" if grid.index(0)
	puts i
	i += 1
end

total = 0
for grid in all_grids
	str = ""
	for i in 0...3
		str += grid[i].to_s
	end
	puts "Adding #{str.to_i}"
	total += str.to_i
end

puts "Total! #{total}"