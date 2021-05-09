### A Pluto.jl notebook ###
# v0.14.0

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ d1105531-8cce-4e11-b57a-a9c4c95989ab
begin
	using QuadGK
	using Distributions
	using Plots
	using StatsPlots
	using PlutoUI
	using Statistics
	using Random
	using StatsBase
end

# ╔═╡ e51d19a0-ae48-11eb-3a0e-a7ef67b35c3b
md"
#### 👉 Question 1
"

# ╔═╡ 747ba95b-ce67-4a34-b49d-d37c16afc2ae
md"* Monte Carlo Approach"

# ╔═╡ f5c64670-e437-429b-8647-b34e04bfa96e
faces = 0:1
#Here assume that 1 stands for heads and 0 stands for tails

# ╔═╡ d8e3dcb2-1838-4cb4-9ff4-b6b93da1bea0
@bind num html" num  =  <input type=range min=4 max=6>"

# ╔═╡ e65ae420-f94c-4451-b3d5-e2c5920d5363
num

# ╔═╡ c3cc4d93-1008-4c83-baaf-3ab907a63040
function monte_carlo(pr)
	ans = 0
	sum1 = 0
	for i in 1:10^num
		sum2 = 0
		for j in 1:50
			if rand(faces)==1
				sum2 = sum2+1
			else 
				continue
			end
		end
		prob = sum2/50
		if prob >= pr
			sum1 = sum1+1
		else 
			continue
		end
	end
	ans = sum1/10^num
end

# ╔═╡ 8d357186-7e21-4d18-ab9b-33ccb9a2446f
begin
	k = 30/50  #as given there should be at least 30 heads
	ans_monte_carlo = monte_carlo(k)
end

# ╔═╡ 3483540a-6c15-46cf-ab67-40de05e10008
md"* Binomial Distribution"

# ╔═╡ 9b0e4c04-81eb-473f-a929-b3a530af09d2
function binomial_(k)
	p = 0.5
	sum_b = 0
	for i in 0:k
		sum_b += big(binomial(50,i)*(p)^i*((1-p)^(50-i)))
	end
	bin_ans = 1 - sum_b 
end

# ╔═╡ b731cc12-a569-4e37-bee6-28ff39101966
begin
	p = 30  #as given there should be at least 30 heads
	k2 = p-1 
	ans_bin = binomial_(k2)
end

# ╔═╡ 4a4f95aa-883c-40eb-bee0-a8e06e09471c
md"* Center Limit Theorem "

# ╔═╡ d8ba2a9a-28fe-4a56-8659-df2385633996
begin
	μ = mean(faces)
	var1 = ((0-0.5)^2 + (1-0.5)^2)/2
	σ = sqrt(var1)
	n = 50
	E_x = n*μ
	sd_x = σ*sqrt(n)
	E_x, sd_x
end

# ╔═╡ 4043afe0-4e65-40c7-a6e5-4d9574a0ba1e
begin
	D_n = Normal(E_x,sd_x)
	plot(10:0.1:40,[pdf(D_n,k) for k in 10:0.1:40], label="Normal Distribution")
	plot!(30.5:0.1:40,[pdf(D_n,k) for k in 30.5:0.1:40], fill=(0,:orange),label="Area of Normal Distribution")
	plot!([30.5,30.5],[0,pdf(D_n,30.5)], label="Boundary region", line=(1,:dash, :green))
end

# ╔═╡ 6a73347d-454d-4de9-a305-030b43de739e
quadgk(x -> pdf(D_n, x), (29.5,40)...)[1]

# ╔═╡ 06554250-51ea-464c-a966-96ade1d42d5a
md"By 'Z' score"

# ╔═╡ 4c3cbe9d-8aad-4e86-b2be-06fb087b75c7
Z = (30.0-E_x)/sd_x

# ╔═╡ fc0dfd4b-18bf-4dc1-b516-418183e1f443
begin
	plot(-4:0.1:4,[pdf(Normal(0,1),k) for k in -4:0.1:4], label="Normal Distribution")
	plot!(Z:0.1:4,[pdf(Normal(0,1),k) for k in Z:0.1:4], fill=(0,:orange),label="Area of Normal Distribution")
	plot!([Z,Z],[0,pdf(Normal(0,1),Z)], label="Boundary region", line=(1,:dash, :green))
end

# ╔═╡ 6d4498c5-befa-4999-8414-ec9eb9f0030b
quadgk(x -> pdf(Normal(0,1), x), (Z-0.14,4)...)[1]

# ╔═╡ e558ba92-3545-46f6-b97f-babda98425de
md"
#### 👉 Question 2
"

# ╔═╡ bb5bb873-b91f-451b-b4eb-be50f7b46935
md"* Center Limit Theorem "

# ╔═╡ 66f850cb-3c82-456f-9e7e-3865c6b2f947
begin
	plot(0:0.1:50,[pdf(D_n,k) for k in 0:0.1:50], label="Normal Distribution")
	plot!(25:0.1:50,[pdf(D_n,k) for k in 25:0.1:50], fill=(0,:orange),label="Area of Normal Distribution")
	plot!([25,25],[0,pdf(D_n,25)], label="Boundary region", line=(1,:dash, :green))
end

# ╔═╡ 4502622f-2ade-4447-a9bb-a331fb42ec7d
Z2 = (25.0-E_x)/sd_x

# ╔═╡ 065368b0-b44a-4326-a830-ab1a0b70c86c
ans2 = quadgk(x -> pdf(Normal(0,1), x), (Z2-0.14,4)...)[1]

# ╔═╡ b26d6147-aaef-4881-9b65-eaf240049019
md"* Binomial Distribution"

# ╔═╡ 81eb6184-cc57-4d64-94bc-34a65ccd1c0e
begin
	p_ = Int(50*(50/100)) #as given 50% chance of going ahead
	k_ = p_ - 1
	ans_bin2 = binomial_(k_)
end

# ╔═╡ 0f8a8a75-57ba-424f-b1fa-4acd3e6e84e7
md"* Monte Carlo Approach"

# ╔═╡ 9891bf4d-eabc-4080-b36b-7d732386d1cb
begin
	p2_ = 50/100 #as given 50% chance of going ahead
	ans_monte_carlo2 = monte_carlo(p2_)
end

# ╔═╡ 5e2e3734-42f9-4d3c-b452-c3d4538f7414
md"
#### 👉 Question 3
"

# ╔═╡ 825ebdff-a65a-4dd9-a9a5-8445aeb16287
begin
	μ3 = 100
	σ3 = 30
	min = +Inf
	for n3 in 25:45
		E_x3 = n3*μ3
		sd_x3 = σ3*sqrt(n3)
		norm3 = Normal(E_x3,sd_x3)
		if quadgk(x -> pdf(norm3, x), (3000,+Inf)...)[1] >= 0.95
			if n3<min
				min = n3
			end
		end
	end
	ans3 = min
end

# ╔═╡ 98e02890-3cf1-4365-a694-969bb64f0130
md"
#### 👉 Question 4
"

# ╔═╡ 1e5c2f24-9c72-46eb-8d22-5fbaa7a2cbce
begin
	D1 = Normal(0,1)
	μ_1, var_1, skew_1, kurt_1 = (mean(D1), var(D1), skewness(D1), kurtosis(D1))
end

# ╔═╡ 6b861ac3-c456-4261-9fbd-995608fdbfca
begin
    function compare_dist(D2)
		Random.seed!(1234)
		k = 10^4
		for n4 in 1:500
			samples = [rand(D2,n4) for _ in 1:k]	
			z_samples = [(sample .- mean(D2))./std(D2) for sample in samples]
			sum_dist = [sum(z_sample)/sqrt(n4) for z_sample in z_samples]
			μ_2, var_2, skew_2, kurt_2 = mean(sum_dist), var(sum_dist), skewness(sum_dist), kurtosis(sum_dist)
			if(abs(skew_1-skew_2)<=0.1 && abs(kurt_1-kurt_2)<=0.1)
				return n4, sum_dist
			end
		end
	end
end

# ╔═╡ 07fae767-355e-4604-89e4-884f5c7286e0
begin
	D_u4 = Uniform()
	D_b1 = Binomial(100,0.01)
	D_b2 = Binomial(100,0.5)
	D_c4 = Chisq(3)
	a, arr1 = compare_dist(D_u4)
	b, arr2 = compare_dist(D_b1)
	c, arr3 = compare_dist(D_b2)
	d, arr4 = compare_dist(D_c4)
	(a, b, c, d)
end

# ╔═╡ 8aea9231-e26d-4901-809c-da31d801054a
begin
	density(arr1, label="Uniform Distribution for n=$a",title="Uniform Distribution")
	plot!(-4:0.1:4, [pdf(Normal(0,1),x) for x in -4:0.1:4], label = "Standard Normal Distribution")
end

# ╔═╡ d95417b9-383b-4127-8c9a-73c9fc3ddfa5
begin
	density(arr1, label="Binomial Distribution for n=$b",title="Binomial Distribution p=0.01")
	plot!(-4:0.1:4, [pdf(Normal(0,1),x) for x in -4:0.1:4], label = "Standard Normal Distribution")
end

# ╔═╡ 9de06b04-f67f-4fab-82a4-3473eaca0ae9
begin
	density(arr1, label="Binomial Distribution for n=$c",title="Binomial Distribution p=0.5")
	plot!(-4:0.1:4, [pdf(Normal(0,1),x) for x in -4:0.1:4], label = "Standard Normal Distribution")
end

# ╔═╡ cb2c454c-1440-4a57-991f-1bd43bf23ee0
begin
	density(arr1, label="Chi square Distribution for n=$d",title="Chi square Distribution")
	plot!(-4:0.1:4, [pdf(Normal(0,1),x) for x in -4:0.1:4], label = "Standard Normal Distribution")
end

# ╔═╡ 94c83667-e811-47b6-8bb1-1e2bbd91151b
md"
#### 👉 Question 5
"

# ╔═╡ 4429d38a-2a87-4780-93ed-89fc353a8358
begin
	x_ = 100-1
	C = Chisq(x_)
end

# ╔═╡ f0c52588-20a5-423f-9278-55bbfe52b791
@bind σ2_2 html" v_  =  <input type=range min=3 max=5 step=0.01>"

# ╔═╡ c6d7d2f2-f885-4f76-ab15-44e2c74bdcf3
σ2_2

# ╔═╡ b925adad-a117-4b53-abf8-90b1309f853f
quadgk(x -> pdf(C, x), (5*99/σ2_2,+Inf)...)[1]

# ╔═╡ c0a34782-6e31-422f-b55e-4b062f9aac9b
σ2_1 = σ2_2/100

# ╔═╡ Cell order:
# ╠═d1105531-8cce-4e11-b57a-a9c4c95989ab
# ╟─e51d19a0-ae48-11eb-3a0e-a7ef67b35c3b
# ╟─747ba95b-ce67-4a34-b49d-d37c16afc2ae
# ╠═f5c64670-e437-429b-8647-b34e04bfa96e
# ╟─d8e3dcb2-1838-4cb4-9ff4-b6b93da1bea0
# ╠═e65ae420-f94c-4451-b3d5-e2c5920d5363
# ╠═c3cc4d93-1008-4c83-baaf-3ab907a63040
# ╠═8d357186-7e21-4d18-ab9b-33ccb9a2446f
# ╟─3483540a-6c15-46cf-ab67-40de05e10008
# ╠═9b0e4c04-81eb-473f-a929-b3a530af09d2
# ╠═b731cc12-a569-4e37-bee6-28ff39101966
# ╟─4a4f95aa-883c-40eb-bee0-a8e06e09471c
# ╠═d8ba2a9a-28fe-4a56-8659-df2385633996
# ╠═4043afe0-4e65-40c7-a6e5-4d9574a0ba1e
# ╠═6a73347d-454d-4de9-a305-030b43de739e
# ╟─06554250-51ea-464c-a966-96ade1d42d5a
# ╠═4c3cbe9d-8aad-4e86-b2be-06fb087b75c7
# ╠═fc0dfd4b-18bf-4dc1-b516-418183e1f443
# ╠═6d4498c5-befa-4999-8414-ec9eb9f0030b
# ╟─e558ba92-3545-46f6-b97f-babda98425de
# ╟─bb5bb873-b91f-451b-b4eb-be50f7b46935
# ╠═66f850cb-3c82-456f-9e7e-3865c6b2f947
# ╠═4502622f-2ade-4447-a9bb-a331fb42ec7d
# ╠═065368b0-b44a-4326-a830-ab1a0b70c86c
# ╟─b26d6147-aaef-4881-9b65-eaf240049019
# ╠═81eb6184-cc57-4d64-94bc-34a65ccd1c0e
# ╟─0f8a8a75-57ba-424f-b1fa-4acd3e6e84e7
# ╠═9891bf4d-eabc-4080-b36b-7d732386d1cb
# ╟─5e2e3734-42f9-4d3c-b452-c3d4538f7414
# ╠═825ebdff-a65a-4dd9-a9a5-8445aeb16287
# ╟─98e02890-3cf1-4365-a694-969bb64f0130
# ╠═1e5c2f24-9c72-46eb-8d22-5fbaa7a2cbce
# ╠═6b861ac3-c456-4261-9fbd-995608fdbfca
# ╠═07fae767-355e-4604-89e4-884f5c7286e0
# ╠═8aea9231-e26d-4901-809c-da31d801054a
# ╠═d95417b9-383b-4127-8c9a-73c9fc3ddfa5
# ╠═9de06b04-f67f-4fab-82a4-3473eaca0ae9
# ╠═cb2c454c-1440-4a57-991f-1bd43bf23ee0
# ╟─94c83667-e811-47b6-8bb1-1e2bbd91151b
# ╠═4429d38a-2a87-4780-93ed-89fc353a8358
# ╠═f0c52588-20a5-423f-9278-55bbfe52b791
# ╠═c6d7d2f2-f885-4f76-ab15-44e2c74bdcf3
# ╠═b925adad-a117-4b53-abf8-90b1309f853f
# ╠═c0a34782-6e31-422f-b55e-4b062f9aac9b
