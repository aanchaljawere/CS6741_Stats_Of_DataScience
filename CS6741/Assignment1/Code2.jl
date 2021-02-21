### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 423eab10-71d8-11eb-2a56-3b86d76ebe3d
begin
	using Plots
	pyplot()
end

# ╔═╡ 2ac99260-71d8-11eb-2420-014c93fac3e9
## Q2

# ╔═╡ 420ff9f2-71d8-11eb-357d-4b36fd31985a
##with replacement

# ╔═╡ 41e1e510-71d8-11eb-3f27-4d3d06333f39
# cards is the deck of 52 cards
cards = ["A","2","3","4","5","6","7","8","9","10","J","Q","K",
		 "A","2","3","4","5","6","7","8","9","10","J","Q","K",
		 "A","2","3","4","5","6","7","8","9","10","J","Q","K",
		 "A","2","3","4","5","6","7","8","9","10","J","Q","K",
		]


# ╔═╡ 41ae2ae0-71d8-11eb-2f0c-c53454a9cadc
begin
	#prob is an array of 5 members, all initialized to 0, it will contain the
	#number of cases corresponding to each index, like index 1 will contain 
	#all those cases where the chosen cards doesn't consist of any Jack, index 2 
	#will contain all those cases where the chosen cards consist of 1 Jack only and 
	#similarly index x will contain all those cases where the chosen cards consist 
	#of x+1 Jacks
	
	prob = zeros(5)
	
	for i in 1:100000
		#cards_1, cards_2, cards_3, cards_4, cards_5 are the cards randomly 	 
		# selected from the deck with replacement
		card_1 = rand(cards)
		card_2 = rand(cards)
		card_3 = rand(cards)
		card_4 = rand(cards)
		card_5 = rand(cards)
		
		#count variable will count the number of Jacks in the randomly chosen cards
		count = 0
		
		#whenever a Jack comes we'll increment count variable by 1
		if card_1 == "J"
			count = count+1
		end
		if card_2 == "J"
			count = count+1
		end
		if card_3 == "J"
			count = count+1
		end
		if card_4 == "J"
			count = count+1
		end
		if card_5 == "J"
			count = count+1
		end
		
		#var is a variable which will represent the index of the array prob
		var = count + 1
		#value at that index corresponding to the number of Jack, will be
		# incremented by 1
		prob[var] = prob[var] + 1
		
	end
end

# ╔═╡ 5c6e70c0-71f5-11eb-0bf8-7b347c4da955
#prob_w1 is the probability with replacement of each case in prob array from case with #0 number of Jacks to case with all 4 Jacks in the randomly chosen cards
prob_w1 = prob/100000

# ╔═╡ 41803d10-71d8-11eb-2729-69fd4f0ceabb

plot(0:4,prob_w1, title="Probability with replacement", label="prob_w1", ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")

# ╔═╡ bf9bd1c0-7375-11eb-1e40-73c99e2e2b60
##without replacement

# ╔═╡ 0e5aa580-7294-11eb-3133-632c44e56b27
begin
	#prob_wo is an array of 5 members, all initialized to 0, it will contain the
	#number of cases corresponding to each index, like index 1 will contain 
	#all those cases where the chosen cards doesn't consist of any Jack, index 2 
	#will contain all those cases where the chosen cards consist of 1 Jack only and 
	#similarly index x will contain all those cases where the chosen cards consist 
	#of x+1 Jacks (and wo represents the without replacement case)
	
	prob_wo = zeros(5)
	
	for i in 1:100000
		
		#cards_copy is the copy of the array cards (not deep copy)
		cards_copy = copy(cards)
		
	    cards_1 = rand(cards_copy)
		#As in this without replacement case we can't pick the chosen card
		#again in the next turn, then we'll delete it from the clone cards array
		#i.e. the cards_copy array
		deleteat!(cards_copy, findfirst(x-> x == cards_1, cards_copy))
		cards_2 = rand(cards_copy)
		deleteat!(cards_copy, findfirst(x-> x == cards_2, cards_copy))
		cards_3 = rand(cards_copy)
		deleteat!(cards_copy, findfirst(x-> x == cards_3, cards_copy))
		cards_4 = rand(cards_copy)
		deleteat!(cards_copy, findfirst(x-> x == cards_4, cards_copy))
		cards_5 = rand(cards_copy)
		
		#count variable will count the number of Jacks in the randomly chosen cards
		count_1 = 0
		
		#whenever a Jack comes we'll increment count variable by 1
		if cards_1 == "J"
			count_1 = count_1+1
		end
		if cards_2 == "J"
			count_1 = count_1+1
		end
		if cards_3 == "J"
			count_1 = count_1+1
		end
		if cards_4 == "J"
			count_1 = count_1+1
		end
		if cards_5 == "J"
			count_1 = count_1+1
		end
		
		#var_1 is a variable which will represent the index of the array prob_wo
		var_1 = count_1 + 1
	    #value at that index corresponding to the number of Jack, will be
		#incremented by 1
		prob_wo[var_1] = prob_wo[var_1] + 1
		
	end
	
end

# ╔═╡ 7177dc70-71fc-11eb-2bfa-0b05c2ce7071
#prob_wo1 is the without replacement probability of each case in prob_wo array from #case with 0 number of Jacks to case with all 4 Jacks in the randomly chosen cards
prob_wo1 = prob_wo/100000

# ╔═╡ 63f3fd00-71f6-11eb-159e-77cfdca5aa90
plot(0:4,prob_wo1,title="Probability without replacement", label="prob_wo1", ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")

# ╔═╡ 63c572f0-71f6-11eb-0ec5-49018e30bf92
begin
	plot(0:4, prob_w1,title="Comparison between the Probabillities", label="prob_w1", ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")
	plot!(0:4, prob_wo1,title="Comparison between the Probabillities",label="prob_wo1", ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")
end

# ╔═╡ 09f512a0-71fe-11eb-3016-e1ff8c885bfd
##Theoretical 

# ╔═╡ 09c269e0-71fe-11eb-16db-1148f002401e
##with replacement

# ╔═╡ 098f9a0e-71fe-11eb-1783-8f6a6cd964e1
function call_prob_with_rep(r)
	den = 52^5
	num = binomial(5,r)*(4^r)*(48^(5-r))
	prob_2 = big(num)/big(den)
	return prob_2
end

# ╔═╡ 095e29d0-71fe-11eb-2bdf-d70abb02bcf4
# prob_curve_with_rep is an array which will contain with replacement probabilities  
# from case  with 0 number of Jacks to case with all 4 Jacks in the randomly chosen cards

prob_curve_with_rep = [call_prob_with_rep(r) for r in 0:4] 

# ╔═╡ 09303bfe-71fe-11eb-3232-3f53fe7945af
plot(0:4, prob_curve_with_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks", label= "prob_curve_with_rep", title="Theoretical Probability With Replacement")

# ╔═╡ 08fea4b0-71fe-11eb-09e4-5d675da30078
begin
	plot(0:4, prob_curve_with_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks", title = "Comparison Plot With Replacement", label = "theoretical")
	plot!(0:4, prob_w1, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks", label = "experimental")
end

# ╔═╡ 08a33e40-71fe-11eb-3409-9100d7b9b141
##without replacement

# ╔═╡ 08752960-71fe-11eb-2cd6-0fcc7e0c0fbb
function call_prob_without_rep(r)
	den = binomial(52,5)
	num = binomial(4,r)*binomial(48,5-r)
	prob_1 = big(num)/big(den)
	return prob_1
end

# ╔═╡ 084343f0-71fe-11eb-35a7-5965a33b654d
prob_curve_without_rep = [call_prob_without_rep(r) for r in 0:4] 

# ╔═╡ 6771a890-7397-11eb-190c-f3d3409ad3ea
plot(0:4, prob_curve_without_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks", label= "prob_curve_without_rep", title="Theoretical Probability Without Replacement")

# ╔═╡ 78eef44e-71fe-11eb-2b24-a74131bf63b1
begin
	plot(0:4, prob_curve_without_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks", title = "Comparison Plot Without Replacement", label = "theoretical")
	plot!(0:4, prob_wo1, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks", label = "experimental")
end

# ╔═╡ 7a7f3350-7395-11eb-14c2-a7a4f8e30fa6
error_wo = prob_curve_without_rep - prob_wo1

# ╔═╡ 7c262c90-7395-11eb-382e-d1dc630d1fc8
plot(0:4, error_wo, xlabel="number_of_jacks", ylabel="error_wo", title="Error Plot  Without Replacement", label = "error_wo")

# ╔═╡ 7a449b52-7395-11eb-20a7-c9815d3c3d92
error_w = prob_curve_with_rep - prob_w1

# ╔═╡ fa1bef10-7398-11eb-31c1-13175f638c43
plot(0:4, error_w, xlabel="number_of_jacks", ylabel="error_w", title="Error Plot With Replacement ", label = "error_w")

# ╔═╡ Cell order:
# ╠═2ac99260-71d8-11eb-2420-014c93fac3e9
# ╠═423eab10-71d8-11eb-2a56-3b86d76ebe3d
# ╠═420ff9f2-71d8-11eb-357d-4b36fd31985a
# ╠═41e1e510-71d8-11eb-3f27-4d3d06333f39
# ╠═41ae2ae0-71d8-11eb-2f0c-c53454a9cadc
# ╠═5c6e70c0-71f5-11eb-0bf8-7b347c4da955
# ╠═41803d10-71d8-11eb-2729-69fd4f0ceabb
# ╠═bf9bd1c0-7375-11eb-1e40-73c99e2e2b60
# ╠═0e5aa580-7294-11eb-3133-632c44e56b27
# ╠═7177dc70-71fc-11eb-2bfa-0b05c2ce7071
# ╠═63f3fd00-71f6-11eb-159e-77cfdca5aa90
# ╠═63c572f0-71f6-11eb-0ec5-49018e30bf92
# ╠═09f512a0-71fe-11eb-3016-e1ff8c885bfd
# ╠═09c269e0-71fe-11eb-16db-1148f002401e
# ╠═098f9a0e-71fe-11eb-1783-8f6a6cd964e1
# ╠═095e29d0-71fe-11eb-2bdf-d70abb02bcf4
# ╠═09303bfe-71fe-11eb-3232-3f53fe7945af
# ╠═08fea4b0-71fe-11eb-09e4-5d675da30078
# ╠═08a33e40-71fe-11eb-3409-9100d7b9b141
# ╠═08752960-71fe-11eb-2cd6-0fcc7e0c0fbb
# ╠═084343f0-71fe-11eb-35a7-5965a33b654d
# ╠═6771a890-7397-11eb-190c-f3d3409ad3ea
# ╠═78eef44e-71fe-11eb-2b24-a74131bf63b1
# ╠═7a7f3350-7395-11eb-14c2-a7a4f8e30fa6
# ╠═7c262c90-7395-11eb-382e-d1dc630d1fc8
# ╠═7a449b52-7395-11eb-20a7-c9815d3c3d92
# ╠═fa1bef10-7398-11eb-31c1-13175f638c43
