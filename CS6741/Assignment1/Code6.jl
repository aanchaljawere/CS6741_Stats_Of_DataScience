### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 844bbb30-740b-11eb-05a3-65fa5a4abf31
begin
	using Plots
	pyplot()
end

# ╔═╡ 2096f610-741d-11eb-3186-ff9f635442ed
using Distributions

# ╔═╡ 0eeb6a50-7435-11eb-3bc0-ffdf87e97d4a


# ╔═╡ 3e8131e0-741d-11eb-0690-a9175d88c95d
#p is the probability whose value will be randomly between 0 and 1
p = rand()

# ╔═╡ dd018b4e-7425-11eb-2453-093db2555987
#Theoretical
begin
	sum = 0
	prob = zeros(10)
	for i in 0:9
		sum += big(binomial(20,i)*((1-p)^i)*(p^(20-i)))
	end
end

# ╔═╡ dcbda480-7425-11eb-0dc4-63cc5ef77150
#theoretical ans
theo_ans = 1 - sum

# ╔═╡ 05619450-740d-11eb-18c6-85e7dbb74d16
# Experimental
begin
	# no_of_wins_loss is an array of 2 members which will contain the total number of 
	# wins and loss at index 1 and 2 respectively
	no_of_wins_loss = zeros(2)
	
	for x in 1:100000
		
		# given initial amt = 10
		initial_amount = 10
		# gain_or_loss is a boolean array, with the help of rand(Bernoulli(p),20) it will 
		# contain 2 values only which will be True and False
		gain_or_loss = rand(Bernoulli(p),20)
		
		amount = initial_amount
		
		for i in 1:20
			# (This is my decision) that if true occurs that means I loss
			if gain_or_loss[i] == true
				amount = amount - 1
			# (This is my decision) that if false occurs that means I won
			elseif gain_or_loss[i] == false
				amount = amount + 1
			end
		end
		
		# If the amount is >= 10 at the last of 20 days then I'll increment the value 		  
		# of the array no_of_wins_loss at index 1, and if the amount is < 10 then at
		# I'll increment the value at index 2
		
		if amount >= 10
			no_of_wins_loss[1] = no_of_wins_loss[1] + 1
		else
			no_of_wins_loss[2] = no_of_wins_loss[2] + 1
		end
	end
	# total_wins is the probability of the total number of wins in 10000 cases
	total_win = no_of_wins_loss[1]/100000
end

# ╔═╡ 55269722-7420-11eb-1e33-3369bb77b61a
# for plotting 
function eval_prob(p)
	sum = 0
	for i in 0:9
		sum = sum + big(binomial(20,i)*((1-p)^i)*(p^(20-i)))
	end
	return 1 - sum
end

# ╔═╡ 84b80502-7420-11eb-37ea-0f0bdcb58cb8
possible_p = [0.0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1.0]

# ╔═╡ d0e0a1d2-7420-11eb-10e2-4972256f006b
plot(possible_p, [eval_prob(p_val) for p_val in possible_p], xlabel = "possible values of p", ylabel = "evaluated prob", label = "eval_prob")

# ╔═╡ Cell order:
# ╠═0eeb6a50-7435-11eb-3bc0-ffdf87e97d4a
# ╠═844bbb30-740b-11eb-05a3-65fa5a4abf31
# ╠═2096f610-741d-11eb-3186-ff9f635442ed
# ╠═3e8131e0-741d-11eb-0690-a9175d88c95d
# ╠═dd018b4e-7425-11eb-2453-093db2555987
# ╠═dcbda480-7425-11eb-0dc4-63cc5ef77150
# ╠═05619450-740d-11eb-18c6-85e7dbb74d16
# ╠═55269722-7420-11eb-1e33-3369bb77b61a
# ╠═84b80502-7420-11eb-37ea-0f0bdcb58cb8
# ╠═d0e0a1d2-7420-11eb-10e2-4972256f006b
