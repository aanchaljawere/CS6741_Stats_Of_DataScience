### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ bcf3d240-7430-11eb-3479-d92456cb6a70
begin
	using Plots
	pyplot()
end

# ╔═╡ 797fa4c0-7431-11eb-0dd8-6bd06d93ba77
using Distributions

# ╔═╡ 148d10d0-7435-11eb-0332-c5b2599cbff5
##Q8

# ╔═╡ 794a3ce0-7431-11eb-313b-3fb2703ead26
# Experimental
begin
	function eval_prob(p)
		# bankrupt is initialized with 0 
		bankrupt = 0
		# amt_greater_than_10_and_no_bankrupcy is the variable initialized with 0 and 
		# incremented when the amount is greater than 0 and when no bankruptcy occur 
		amt_greater_than_10_and_no_bankrupcy = 0
		
		for x in 1:1000000
			# given initial amt = 10
			initial_amount = 10
			# gain_or_loss is a boolean array, with the help of rand(Bernoulli(p),20)
		    # it will contain 2 values only which will be True and False
			gain_or_loss = rand(Bernoulli(p),20)

			amt = initial_amount

			# temp variable which is initialized with 0 and will become 1 whenever 
			# bankruptcy occur
			temp = 0
			for i in 1:20
				# (This is my decision) that if false occurs that means I won
				if gain_or_loss[i] == false
					amt = amt + 1
				# (This is my decision) that if true occurs that means I lose
				elseif gain_or_loss[i] == true
					amt = amt - 1
				end

				
				# If the amount = 0, within this 20 days that means we are bankrupt
				# now and then we'll increment the bankrupt variable and also temp 
				# will be incremented
				if amt == 0
					bankrupt = bankrupt + 1
					#we'll apply break here as it is asked for atleast one time 
					temp = 1
					break
				else
					continue
				end
			end
			
	#According to this if condition the variable amt_greater_than_10_and_no_bankruptcy
	# will be incremented when the amount is greater than 0 and when no bankruptcy 
	#occur
			if amt >=10 && temp==0
				amt_greater_than_10_and_no_bankrupcy += 1
			end

		end
		not_bankrupt = 1000000 - bankrupt
		
		prob_bankrupt = bankrupt/1000000
		prob_not_bankrupt = 1 - prob_bankrupt

		# this is the intersection of probability of event A & probability of event B
		prob_numerator = amt_greater_than_10_and_no_bankrupcy/ not_bankrupt

		prob_ans = prob_numerator/prob_not_bankrupt
		return prob_ans
	end
end

# ╔═╡ 7918a590-7431-11eb-21af-b1a5885bbe3e
#check_val
begin
	p = 0.5
	ans = eval_prob(p)
end

# ╔═╡ 78ea69a0-7431-11eb-2c04-cd7373b21982
possible_p = [0.0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1.0]

# ╔═╡ a56efac0-7433-11eb-3284-255adbed689b
plot(possible_p, [eval_prob(p_val) for p_val in possible_p], xlabel = "possible values of p", ylabel = "required probability", label = "eval_prob")

# ╔═╡ Cell order:
# ╠═148d10d0-7435-11eb-0332-c5b2599cbff5
# ╠═bcf3d240-7430-11eb-3479-d92456cb6a70
# ╠═797fa4c0-7431-11eb-0dd8-6bd06d93ba77
# ╠═794a3ce0-7431-11eb-313b-3fb2703ead26
# ╠═7918a590-7431-11eb-21af-b1a5885bbe3e
# ╠═78ea69a0-7431-11eb-2c04-cd7373b21982
# ╠═a56efac0-7433-11eb-3284-255adbed689b
