### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 167a37c0-72a9-11eb-100d-b3e2704b1d41
begin
	using Plots
	pyplot()
end

# ╔═╡ 316193d0-72a9-11eb-149a-5926b763c15e
using Random

# ╔═╡ 09faeb60-7435-11eb-191e-11caa1bc3134
##Q5

# ╔═╡ 374e2600-72a9-11eb-262b-5d0af54a279e
actual_password = randstring(['A':'Z'; 'a':'z'; '0':'9'; '~'; '!'; '@'; '#'; '$'; '%'; '^'; '&'; '*'; '('; ')'; '_'; '+'; '='; '-'; '`' ], 8)

# ╔═╡ 3021fbf0-737a-11eb-2990-01adbd404e35
#match_str is an array of 9 members where i index will contain the number of strings with i-1 characters common
match_str = zeros(Int,9)

# ╔═╡ 3722d040-72a9-11eb-1a23-4303bc21942e
begin
	# prob_str is an array of 9 elements where index i will contain the number of all 
	# those cases where the actual password and the trial (or hacker) password will 	# have i-1 characters common
	prob_str = zeros(9)
	
	for i in 1:1000000
		trial_password = randstring(['A':'Z'; 'a':'z'; '0':'9'; '~'; '!'; '@'; '#'; '$'; '%'; '^'; '&'; '*'; '('; ')'; '_'; '+'; '='; '-'; '`' ], 8)
		
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
		match_str[var1] = match_str[var1] + 1
		
	end
end

# ╔═╡ 36faaed0-72a9-11eb-0732-3f1ade5c3bce
# Dividing by 1000000 for finding the probability
prob_str2 = prob_str/1000000

# ╔═╡ 36cf5910-72a9-11eb-28ca-e390a8f146b5
match_str

# ╔═╡ 369fe4a0-72a9-11eb-3798-bf170204a5e5
md"
New_rule: 

From match_str array we came to know that- 

Number of strings with no common character = 901711 (>1000) 

Number of strings with 1 common character = 93927 (>1000)

Number of strings with 2 common characters = 4242 (>1000) 

Number of strings with 3 common characters = 117 (<=1000)

Number of strings with 4 common characters = 3 (<=1000) 

Number of strings with 5 common characters = 0 (<=1000) 

Number of strings with 6 common characters = 0 (<=1000)

 Number of strings with 7 common characters = 0 (<=1000)

 Number of strings with 9 common characters = 0 (<=1000)

-> (117 + 3 + 0 + 0 + 0 + 0) <= 1000

As we do not want to store more than 1000 entries in the database, then it would not be possible for us to store those passwords which are having less than 3 characters as the common one, because possibility of such strings will be more than 1000, whereas the overall sum of the number of those strings with 3 or more common characters is less than 1000.

In terms of probability we can say that we'll store only those passwords whose overall sum of probability will be less than 0.001 (=1000/1000000) or only those passwords having at least 3 characters as the common one.
"

# ╔═╡ 29c892a0-7384-11eb-3b05-a7e7f1f22b7f
ans = 1 - prob_str2[1] - prob_str2[2] - prob_str2[3] 

# ╔═╡ e05c2940-737b-11eb-1510-5d64aa7be19c
#Plot corresponding to common characters 
plot(0:8, prob_str2, line=:stem, marker=:circle, ylims=(0.0,1), label="password with x common characters", xlabel="number of common characters", ylabel="probability")

# ╔═╡ d0357fe0-737f-11eb-0de5-25602246725b
#Theoretical :

begin
	den = 78^8
	num1 = binomial(8,0)*(1)^0*(77)^8
	num2 = binomial(8,1)*(1)^1*(77)^7
	num3 = binomial(8,2)*(1)^2*(77)^6
	theo_prob = 1 - big(num1)/big(den) - big(num2)/big(den) - big(num3)/big(den)
end

# ╔═╡ Cell order:
# ╠═09faeb60-7435-11eb-191e-11caa1bc3134
# ╠═167a37c0-72a9-11eb-100d-b3e2704b1d41
# ╠═316193d0-72a9-11eb-149a-5926b763c15e
# ╠═374e2600-72a9-11eb-262b-5d0af54a279e
# ╠═3021fbf0-737a-11eb-2990-01adbd404e35
# ╠═3722d040-72a9-11eb-1a23-4303bc21942e
# ╠═36faaed0-72a9-11eb-0732-3f1ade5c3bce
# ╠═36cf5910-72a9-11eb-28ca-e390a8f146b5
# ╠═369fe4a0-72a9-11eb-3798-bf170204a5e5
# ╠═29c892a0-7384-11eb-3b05-a7e7f1f22b7f
# ╠═e05c2940-737b-11eb-1510-5d64aa7be19c
# ╠═d0357fe0-737f-11eb-0de5-25602246725b
