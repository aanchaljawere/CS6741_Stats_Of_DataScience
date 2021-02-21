### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 7e55598e-728d-11eb-388d-c53a1fbd120c
begin
	using Plots
	pyplot()
end

# ╔═╡ cb242c00-728e-11eb-2687-e7d54d3aa54e
using Random

# ╔═╡ 030c5280-7435-11eb-0c9b-8549ea188b34
##Q4

# ╔═╡ a2991a2e-728d-11eb-2fe3-975ea9585c14
actual_password = randstring(['A':'Z'; 'a':'z'; '0':'9'; '~'; '!'; '@'; '#'; '$'; '%'; '^'; '&'; '*'; '('; ')'; '_'; '+'; '='; '-'; '`' ], 8)

# ╔═╡ a2488930-728d-11eb-13a3-190fcda79790
begin
	# prob_str is an array of 9 elements where index i will contain the number of all 
	# those cases where the actual password and the trial (or hacker) password will 	# have i-1 characters common
	prob_str = zeros(9)
	
	for i in 1:1000000
		trial_password = randstring(['A':'Z'; 'a':'z'; '0':'9'; '~'; '!'; '@'; '#'; 		'$'; '%'; '^'; '&'; '*'; '('; ')'; '_'; '+'; '='; '-'; '`' ], 8)
		
		#count variable count the number of common characters in both the passwords
		count=0
		
		for j in 1:8
			if actual_password[j] == trial_password[j]
				count = count+1
			end
		end
		
		# var1 is the index corresponding to the count value in prob_str array
		var1 = count+1
		prob_str[var1] = prob_str[var1] + 1
		
	end
end

# ╔═╡ 63e5ea80-742b-11eb-3261-c5d60f07fc80
# Dividing by 1000000 for finding the probability
prob_str1 = prob_str/1000000

# ╔═╡ 6e1c0d40-742b-11eb-1a39-9354dce6e013
ans = 1 - prob_str1[1] - prob_str1[2]

# ╔═╡ 581f29c0-7438-11eb-399d-779d1bc25ab4
#Plot corresponding to common characters 
plot(0:8, prob_str1, line=:stem, marker=:circle, ylims=(0.0,1), label="password with x common characters", xlabel="number of common characters", ylabel="probability")

# ╔═╡ 300c17f0-7293-11eb-3af0-9f252f923e0e
#Theoretical :

begin
	den = 78^8
	num1 = binomial(8,0)*(1)^0*(77)^8
	num2 = binomial(8,1)*(1)^1*(77)^7
	theo_prob = 1 - big(num1)/big(den) - big(num2)/big(den)
end

# ╔═╡ cb6f28a0-7297-11eb-0820-2bd4cb4f11b4


# ╔═╡ Cell order:
# ╠═030c5280-7435-11eb-0c9b-8549ea188b34
# ╠═7e55598e-728d-11eb-388d-c53a1fbd120c
# ╠═cb242c00-728e-11eb-2687-e7d54d3aa54e
# ╠═a2991a2e-728d-11eb-2fe3-975ea9585c14
# ╠═a2488930-728d-11eb-13a3-190fcda79790
# ╠═63e5ea80-742b-11eb-3261-c5d60f07fc80
# ╠═6e1c0d40-742b-11eb-1a39-9354dce6e013
# ╠═581f29c0-7438-11eb-399d-779d1bc25ab4
# ╠═300c17f0-7293-11eb-3af0-9f252f923e0e
# ╠═cb6f28a0-7297-11eb-0820-2bd4cb4f11b4
