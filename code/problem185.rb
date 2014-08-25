input = "90342 ;2 correct
70794 ;0 correct
39458 ;2 correct
34109 ;1 correct
51545 ;2 correct
12531 ;1 correct".split("\n")

input2 = "5616185650518293 ;2 correct
3847439647293047 ;1 correct
5855462940810587 ;3 correct
9742855507068353 ;3 correct
4296849643607543 ;3 correct
3174248439465858 ;1 correct
4513559094146117 ;2 correct
7890971548908067 ;3 correct
8157356344118483 ;1 correct
2615250744386899 ;2 correct
8690095851526254 ;3 correct
6375711915077050 ;1 correct
6913859173121360 ;1 correct
6442889055042768 ;2 correct
2321386104303845 ;0 correct
2326509471271448 ;2 correct
5251583379644322 ;2 correct
1748270476758276 ;3 correct
4895722652190306 ;1 correct
3041631117224635 ;3 correct
1841236454324589 ;3 correct
2659862637316867 ;2 correct".split("\n")
codes = Array.new

for row in input
	numbers, correct = row.split(";")
	g = correct[0].to_i
	i = 0

	numbers.each_char do |c|
		codes[i] ||= Hash.new
		codes[i][c] ||= 0
		codes[i][c] += g*g if g > 0
		codes[i][c] = -100 if g == 0
		i+=1
	end
end

str = ""
for code in codes
	str = str + code.max_by{|k, v| v}[0]
end
puts str
puts codes