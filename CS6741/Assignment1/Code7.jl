### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ dec2fc50-7423-11eb-1fb5-4551d42851a6
begin
	using Plots
	pyplot()
end

# ╔═╡ de970a50-7423-11eb-17a6-e343645857d2
using Distributions

# ╔═╡ 7f2ff9a0-7423-11eb-1cef-0b25bb6923b9
##Q7

# ╔═╡ f30ffa00-7423-11eb-35bf-41651f3be924
# Experimental
begin
	function eval_prob(p)
		# bankrupt (the reqd value) is initialized with 0 
		bankrupt = 0

		for x in 1:1000000
			# given initial amt = 10
			initial_amount = 10
			# gain_or_loss is a boolean array, with the help of rand(Bernoulli(p),20)
		    # it will contain 2 values only which will be True and False
			gain_or_loss = rand(Bernoulli(p),20)

			amt = initial_amount

			for i in 1:20
				# (This is my decision) that if false occurs that means I won
				if gain_or_loss[i] == false
					amt = amt + 1
				# (This is my decision) that if true occurs that means I loss
				elseif gain_or_loss[i] == true
					amt = amt - 1
				end

				
				# If the amount = 0, within this 20 days that means we are bankrupt
				# now and then we'll increment the bankrupt variable
				if amt == 0
					bankrupt = bankrupt + 1
					#we'll apply break here as it is asked for atleast one time 
					break
				else
					continue
				end

			end
		end
		prob_bankrupt = bankrupt/1000000
		return prob_bankrupt
	end
end

# ╔═╡ 6315e8f0-742e-11eb-2584-bb07cbe2191e
#check_val
begin
	p1  = rand()
	prob = eval_prob(p1)
end

# ╔═╡ a7d23160-742e-11eb-0e91-576ab315c51e
possible_p = [0.0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1.0]

# ╔═╡ fe421380-7424-11eb-11cd-d9ad64cd0591
plot(possible_p, [eval_prob(p_val) for p_val in possible_p], xlabel = "possible values of p", ylabel = "probability of bankruptcy", label = "eval_prob")

# ╔═╡ Cell order:
# ╠═7f2ff9a0-7423-11eb-1cef-0b25bb6923b9
# ╠═dec2fc50-7423-11eb-1fb5-4551d42851a6
# ╠═de970a50-7423-11eb-17a6-e343645857d2
# ╠═f30ffa00-7423-11eb-35bf-41651f3be924
# ╠═6315e8f0-742e-11eb-2584-bb07cbe2191e
# ╠═a7d23160-742e-11eb-0e91-576ab315c51e
# ╠═fe421380-7424-11eb-11cd-d9ad64cd0591
