
def changer (coins, target)
	t = Array.new(target + 1, 0)
	t[0] = 1

	coins.each do |coin|
		j = 0
		for j in 0..target-coin
			t[(j+coin)] += t[j]
			j += 1
		end
	end

	t[target]
end

coins = [1,2,5,10,20,50,100,200]
answer = changer(coins, 200)

puts "2 pounds can be made in #{answer} ways using any number of coins."