### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 0103fdb0-7077-11eb-2beb-f7a09919c29c
begin
	using Plots
	pyplot()
end

# ╔═╡ f85fee50-7434-11eb-1787-71f1e6359f08
##Q1

# ╔═╡ 63dec930-70f7-11eb-34b4-dd801020f98b
# val is the range from which we'll select the values randomly 
val_rng = -10^8:10^8

# ╔═╡ 3804cd30-7077-11eb-2271-a7c7facd0bad
# lln(n) is a function which will take input a number n which is basically the number 
# of integers which will be randomly selected and then their mean will be calculates 
# which is then returned as the output

function lln(n)
	val1 = rand(val_rng)
	sum1 = val1
	for i in 1:n 
		val2 = rand(val_rng)
		sum1 = sum1 + val2
	end
	mean = sum1/n
	return mean
end

# ╔═╡ 3804cd30-7077-11eb-03f3-853b0239326f
# mean_curve is basically the array which will contain the value of mean for n number # of integers
mean_curve = [lln(big(n)) for n in 1:1000] 

# ╔═╡ 37a6ceb0-7077-11eb-2da0-e167772d93e1
# plotting the graph where x axis represents the number of integers taken and
# y axis represents the value of mean
plot(1:1000, mean_curve, title="Law of large numbers",label="mean", ylabel="mean", ylims=(-8*10^7,8*10^7), xlabel="number of chosen numbers")

# ╔═╡ Cell order:
# ╠═f85fee50-7434-11eb-1787-71f1e6359f08
# ╠═0103fdb0-7077-11eb-2beb-f7a09919c29c
# ╠═63dec930-70f7-11eb-34b4-dd801020f98b
# ╠═3804cd30-7077-11eb-2271-a7c7facd0bad
# ╠═3804cd30-7077-11eb-03f3-853b0239326f
# ╠═37a6ceb0-7077-11eb-2da0-e167772d93e1
