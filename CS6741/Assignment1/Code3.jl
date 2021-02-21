### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ b02428a2-71ae-11eb-2387-9fb1b961a99c
begin
	using Plots
	pyplot()
end

# ╔═╡ fbd39140-7434-11eb-3261-cda6867436be
##Q3

# ╔═╡ e0333e10-71c6-11eb-3882-a7dc83ef63eb
##without replacement

# ╔═╡ b7505700-71bf-11eb-135a-23da588d4501
function call_prob_without_rep(r)
	den = binomial(52,5)
	num = binomial(4,r)*binomial(48,5-r)
	prob_1 = big(num)/big(den)
	return prob_1
end

# ╔═╡ bb056fc0-71bf-11eb-1593-55adcc50490b
prob_curve_without_rep = [call_prob_without_rep(r) for r in 0:4] 

# ╔═╡ bac1b000-71bf-11eb-2b2e-31940fe5a848
plot(0:4, prob_curve_without_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")

# ╔═╡ ba66bec2-71bf-11eb-0425-e54ad003de6e
##with replacement

# ╔═╡ ba0edabe-71bf-11eb-011b-db0e59214245
function call_prob_with_rep(r)
	den = 52^5
	num = binomial(5,r)*(4^r)*(48^(5-r))
	prob_2 = big(num)/big(den)
	return prob_2
end

# ╔═╡ 0f4fa300-71c7-11eb-1694-c7d2255435df
prob_curve_with_rep = [call_prob_with_rep(r) for r in 0:4] 

# ╔═╡ 0eda72fe-71c7-11eb-1629-6fbc4bf0ff8e
plot(0:4, prob_curve_with_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")

# ╔═╡ 0e92e2b0-71c7-11eb-1574-3127cee59dc7
begin
	plot(0:4, prob_curve_without_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")
	plot!(0:4, prob_curve_with_rep, ylabel="prob(number_of_jacks)", xlabel="number_of_jacks")
end

# ╔═╡ Cell order:
# ╠═fbd39140-7434-11eb-3261-cda6867436be
# ╠═b02428a2-71ae-11eb-2387-9fb1b961a99c
# ╠═e0333e10-71c6-11eb-3882-a7dc83ef63eb
# ╠═b7505700-71bf-11eb-135a-23da588d4501
# ╠═bb056fc0-71bf-11eb-1593-55adcc50490b
# ╠═bac1b000-71bf-11eb-2b2e-31940fe5a848
# ╠═ba66bec2-71bf-11eb-0425-e54ad003de6e
# ╠═ba0edabe-71bf-11eb-011b-db0e59214245
# ╠═0f4fa300-71c7-11eb-1694-c7d2255435df
# ╠═0eda72fe-71c7-11eb-1629-6fbc4bf0ff8e
# ╠═0e92e2b0-71c7-11eb-1574-3127cee59dc7
