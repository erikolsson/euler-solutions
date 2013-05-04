

class CubePermutations
	attr_accessor :permutations
	attr_accessor :smallest_n
	def initialize(n)
		@smallest_n = n
		@permutations = 0
	end
end

cubes = Hash.new

def largest_permutation (n)
	n.to_s.chars.sort.reverse
end

i = 1
while true
	cube = i * i * i
	largest = largest_permutation(cube)
	cubes[largest] ||= CubePermutations.new(i)
	cubes[largest].permutations += 1

	if cubes[largest].permutations == 5
		perm = cubes[largest].smallest_n
		puts "the smallest cube: #{perm * perm * perm}"
		break
	end

	i+=1
end