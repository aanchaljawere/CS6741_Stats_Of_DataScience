### A Pluto.jl notebook ###
# v0.14.0

using Markdown
using InteractiveUtils

# ╔═╡ 882ef94d-6765-40f5-93d3-3facaa5d9a31
begin
	using QuadGK
	using Distributions
	using Plots
	using StatsPlots
	using PlutoUI
	using Statistics
	using CSV
	using DataFrames
	using Dates
	using Random
end

# ╔═╡ a1e0c9a0-955e-11eb-00cc-df6225dab69a
md"👉 Question 1"

# ╔═╡ 560d7a1d-8957-4ac4-b0db-5e0b696226e4
begin
	function px(i)
		t = TDist(i)
		return t
	end
	
	function qx()
		n = Normal(0,1)
		return n
	end
end

# ╔═╡ fded008e-d16b-4b52-a545-ee9f9ca52932
begin
	function KLdiv(px_,qx_)
		return quadgk(x -> pdf(px_, x) * log(pdf(px_, x)/pdf(qx_, x)), (-20,20)...)
	end
end

# ╔═╡ 9306b136-5804-407f-ae7a-5890d23bbc35
begin
	val = []
	qx_ = qx()
	for i in 1:5
		px_ = px(i)
		push!(val,KLdiv(px_,qx_)[1])
	end
end

# ╔═╡ 45d1e58f-aec6-4b6c-922a-8fcfa3a3e823
val

# ╔═╡ 5c9ac826-ae1a-485e-8b64-f7d1fd82fbc5
md"👉 Question 2"

# ╔═╡ 9a6aff3a-dcec-4f56-a565-fbbf9295de49
u = Uniform(0,1)

# ╔═╡ f4527eb1-6fbb-4918-85d3-2c72a4bcf0c5
#for n=2
begin
	conv(x) = quadgk(k-> pdf(u,x-k)*pdf(u,k), (0,1)...)[1]
	conv2(x) = quadgk(k-> conv(x-k)*pdf(u,k), (0,1)...)[1]
	co = conv2.(-10:0.1:10)
end

# ╔═╡ d9ab180a-08b6-4a7a-83d2-8a406aaddfcf
function pdf_(x,n)
	#temp = Float64[]
	if n==2
		return quadgk(k-> pdf(u,x-k)*pdf(u,k), (0,1)...)[1]
	else
	    return quadgk(k-> pdf_(x-k,n-1)*pdf(u,k), (0,1)...)[1]
	end
end

# ╔═╡ 5fd53ca6-721d-4e21-86e5-4f4d43747f90
nval_ = rand(2:10)

# ╔═╡ 172d982a-e72b-4a5e-9769-d6b9a56ae25e


# ╔═╡ c350ccf1-44c5-435e-ad42-f5d03cad7dbd


# ╔═╡ a29c8480-c9e1-4d57-a714-f1c930378fb9
md"👉 Question 3"

# ╔═╡ a4d9406f-fc23-4d70-9ddd-7b9750c46b19
begin
	a_ = rand(0:30,5000)
	b_ = rand(31:50,1000)
	c_ = rand(51:75,800)
	d_ = rand(76:90,200)
	e_ = rand(91:100,30)
	f_ = rand(101:120,20)
 	syn_dataset_ = cat(a_, b_, c_, d_, e_, f_, dims =(1, 1))
end

# ╔═╡ a56c0f6a-6ab0-4f90-a3da-ef851ddf1d70
density(syn_dataset_, label="synthetic_dataset", line=(4, :blue), fill=(0, :blue, 0.3),xlim=(-10,120))

# ╔═╡ 32a0fc39-37d1-4b88-8fca-440b5dee4f9c
begin	 
    mean1_ = mean(syn_dataset_)
	median1_ = median(syn_dataset_)
	mode1_ = mode(syn_dataset_)
	mean1_, median1_, mode1_
end

# ╔═╡ 5310fe4d-f1e6-49e9-ab26-9a137e2b3762
function density_plot(dataset_)
	density(dataset_, label="synthetic_dataset", line=(4, :blue), fill=(0, :blue, 0.3),xlim=(-10,120))
	mean_val = mean(dataset_)
	median_val = median(dataset_)
	mode_val = mode(dataset_)
	plot!([mean_val, mean_val], [0, 0.022], label="Mean", line=(4, :dash, :green))
	plot!([median_val, median_val], [0, 0.023], label="Median", line=(3, :dot, :orange))
	plot!([mode_val, mode_val], [0, 0.023], label="Mode", line=(1, :red))
end

# ╔═╡ a43b6bb0-717d-4d95-9cc1-47c839ebee70
density_plot(syn_dataset_)

# ╔═╡ 4ec31cee-3db7-44a1-8285-4c97a9252186
begin
	a = rand(0:30,5000)
	b = rand(31:50,1000)
	c = rand(51:75,800)
	d = rand(76:90,200)
	e = rand(91:100,30)
	f = rand(101:120,20)
	add_ = Int64[]
	for i in 1:1050
		push!(add_,5)
	end	
	for i in 1:550
		push!(add_,8)
	end	
	for i in 1:750
		push!(add_,18)
	end	
	for i in 1:300
		push!(add_,19)
	end	
	for i in 1:200
		push!(add_,20)
	end	
	for i in 1:850
		push!(add_,21)
	end	
	for i in 1:1050
		push!(add_,22)
	end	
	for i in 1:1050
		push!(add_,23)
	end	
	for i in 1:1050
		push!(add_,24)
	end	
	for i in 1:1050
		push!(add_,25)
	end	
	for i in 1:1050
		push!(add_,26)
	end	
	for i in 1:850
		push!(add_,27)
	end	
	for i in 1:850
		push!(add_,28)
	end	
	for i in 1:850
		push!(add_,29)
	end	
	for i in 1:850
		push!(add_,30)
	end	
	
	synthetic_dataset = cat(a, b, c, d, e, f, add_ ,dims =(1, 1))
end

# ╔═╡ d8b8885a-4932-483a-9263-8574467ae1c1
density(synthetic_dataset, label="synthetic_dataset", line=(4, :blue), fill=(0, :blue, 0.3),xlim=(-10,120))

# ╔═╡ 16fc51a8-42df-415d-a7b9-61ee40c01b44
begin	 
    mean_ = mean(synthetic_dataset)
	median_ = median(synthetic_dataset)
	mode_ = mode(synthetic_dataset)
	mean_, median_, mode_
end

# ╔═╡ b4de3a3f-1108-42f2-8d67-9ce5866ad381
function density_plot_new(dataset_)
	density(dataset_, label="synthetic_dataset", line=(4, :blue), fill=(0, :blue, 0.3),xlim=(-10,120))
	mean_val = mean(dataset_)
	median_val = median(dataset_)
	mode_val = mode(dataset_)
	plot!([mean_val, mean_val], [0, 0.062], label="Mean", line=(4, :dash, :green))
	plot!([median_val, median_val], [0, 0.062], label="Median", line=(3, :dot, :orange))
	plot!([mode_val, mode_val], [0, 0.058], label="Mode", line=(1, :red))
end

# ╔═╡ 90bc485d-6aef-4253-99db-69191d15215f
density_plot_new(synthetic_dataset)

# ╔═╡ 16769103-d5bc-4ff5-a1b8-ffb338f89ca4
md"👉 Question 4"

# ╔═╡ 3401d449-5e35-44a0-98c7-265de48dbfd7
sample_ = [rand(Uniform(0,1), 30) for _ in 1:10000]

# ╔═╡ 7014470c-14cb-40a1-a28f-68cad20bd8c4
begin
	range_arr = Float64[]
	for i in 1:10000
		push!(range_arr,maximum(sample_[i]) - minimum(sample_[i]))
	end
end

# ╔═╡ 33796384-ac65-45a3-bedb-6e96d27f2ad1
range_arr #new sample

# ╔═╡ ad50fd22-45c4-4c95-8fbb-338ff444d0d6
function histogram_plot(arr_)
	histogram(arr_, label="Range_array", xlabel="values in array", ylabel= "frequency")
	mean_val = mean(arr_)
	mode_val = mode(arr_)
	median_val = median(arr_)
	scatter!((mean_val, 0), label="Mean", legend=:topleft)
	scatter!((median_val, 0), label="Median")
	scatter!((mode_val, 0), label="Mode")

	plot!([mean_val, mean_val], [0, 450], label="Mean", line=(4, :dash, :red))
	plot!([median_val, median_val], [0, 450], label="Median", line=(3, :dash, :green))
	plot!([mode_val, mode_val], [0, 450], label="Mode", line=(3, :dash, :purple))
end

# ╔═╡ 5c92151e-ee68-4ed9-a758-4dfff602e26f
histogram_plot(range_arr)

# ╔═╡ 8436bd55-5048-47ab-ab52-01b949fa7724
md"👉 Question 6"

# ╔═╡ b2ab1a19-119b-4866-abff-bebab56147ef
df = CSV.read("C:\\Users\\aanch\\OneDrive\\Desktop\\My Documents\\IIT Madras\\Study Material\\Semester 2\\Stats for DS\\states.csv", DataFrame)

# ╔═╡ 940948b1-7475-4179-9b00-dad0be00d157
#India not a state
df_new = df[df.State .!= "India", :]

# ╔═╡ 17f29e4d-aeb7-4634-9e55-c11aaf8ab2a1
n = nrow(df_new)

# ╔═╡ 785d2702-9ea2-4843-8144-f27176df810f
#Adding week numbers to the dataframe
begin
	num_week=[]
	for i in 1:n
		if (year(df_new[!,:Date][i])==2020)
			push!(num_week,week(df_new[!,:Date][i]))
		else 
			push!(num_week,week(df_new[!,:Date][i])+53)
		end
	end
end

# ╔═╡ 744f692e-6cf9-498c-a0c5-6880ac24ac02
insertcols!(df_new,1,:Week => num_week)

# ╔═╡ 1eacf6e3-82c9-4e9e-8c72-5c34cc6e2387
select!(df_new,[:Date,:State,:Confirmed,:Week])

# ╔═╡ 98f502fe-8c2a-4829-832a-44410c8b0c33
begin
	gdf= groupby(df_new, [:State,:Week])
	data_values=combine(gdf, :Confirmed => sum)
end

# ╔═╡ 54baf531-eafc-4d11-afd9-4790d2ab58cb
data_per_state = unstack(data_values,:Week,:State,:Confirmed_sum)

# ╔═╡ 3ca103a0-f38a-421d-8056-6f61320addae
size(data_per_state)

# ╔═╡ b5e883a3-76cc-4154-b8db-5940725d0178
#Removing Union Territories and State Unassigned
begin
	select!(data_per_state, Not(names(data_per_state)[38]))
	select!(data_per_state, Not(names(data_per_state)[37]))
	select!(data_per_state, Not(names(data_per_state)[34]))
	select!(data_per_state, Not(names(data_per_state)[28]))
	select!(data_per_state, Not(names(data_per_state)[20]))
	select!(data_per_state, Not(names(data_per_state)[18]))
	select!(data_per_state, Not(names(data_per_state)[8]))
end

# ╔═╡ d47b3b97-81ee-4c34-b549-ed5d247135fb
size(data_per_state)

# ╔═╡ d4a0ac56-fd2b-4f41-9ac7-b869d7e5da9c
df_states = select!(data_per_state,Not(:Week))

# ╔═╡ a7d62349-700d-41c6-9c83-a1ae2b6306ce
function covmat(df)
   nc = ncol(df)
   t = zeros(nc, nc)
   for (i, c1) in enumerate(eachcol(df))
	   for (j, c2) in enumerate(eachcol(df))
		   sx, sy = skipmissings(c1, c2)
		   t[i, j] = cov(collect(sx), collect(sy))
	   end
   end
   return t
end

# ╔═╡ 5c373657-bd60-40f0-b64f-a5357b582e96
function pearson_cormat(df)
   nc = ncol(df)
   t = zeros(nc, nc)
   for (i, c1) in enumerate(eachcol(df))
	   for (j, c2) in enumerate(eachcol(df))
		   sx, sy = skipmissings(c1, c2)
		   t[i, j] = cor(collect(sx), collect(sy))
	   end
   end
   return t
end

# ╔═╡ 8cfd6104-2c3c-473c-91bc-bcbe73fd2382
begin
	findpos(arr) = [indexin(arr[i], sort(arr))[1] for i in 1:length(arr)]
	
	function spearman_cormat(df)
	   nc = ncol(df)
	   t = zeros(nc, nc)
	   for (i, c1) in enumerate(eachcol(df))
		   for (j, c2) in enumerate(eachcol(df))
			   sx, sy = skipmissings(c1, c2)
			   t[i, j] = cor(findpos(collect(sx)), findpos(collect(sy)))
		   end
	   end
	   return t
	end
end

# ╔═╡ 89031de0-4cf6-4d4a-8e01-db738dcb85d8
covariance = covmat(df_states)

# ╔═╡ 81518534-e03b-4dc8-8bac-b4ffe8ed3078
pearsons_correlation = pearson_cormat(df_states)

# ╔═╡ 6a54101b-3a58-49d6-bb64-1e91d0d762c0
spearman_correlation = spearman_cormat(df_states)

# ╔═╡ fa09d5b4-f201-4117-a8d2-468c22603b14
ncol(df_states)

# ╔═╡ 029aaf7e-cb98-4d88-a857-fe76b80093e7
begin
	len = length(names(df_states))
	States= [names(df_states)[i] for i in 1:len]
end

# ╔═╡ e403fa82-a567-4625-b247-69485bf05617
heatmap(States, States, covariance,title="Covariance")

# ╔═╡ 481c7582-9208-4dc2-b117-9a3b015cea71
heatmap(States, States, pearsons_correlation,title="Pearson's Correlation")

# ╔═╡ efd626aa-681f-4640-be7f-0e4584cbabb6
heatmap(States, States, spearman_correlation,title="Spearman's Correlation")

# ╔═╡ ee7953a4-cfda-4b23-9943-1c49a0375fcc
md"👉 Question 7"

# ╔═╡ 4415d906-f4a3-4b2b-9100-b40bc05c5bc2
function OneSidedTail_Normal(x)
	var=0
	for i in -10:0.01:10
		percentile = (100-x)/100
		if quadgk(k-> pdf(qx(),k),(-Inf,i)...)[1] >= percentile
			var=i
			break
		end
	end
	return var
end

# ╔═╡ 4dc90419-74dc-4916-9cd5-56204f6deda2
function OneSidedTail_TDist(x)
	var=0
	for i in -10:0.01:10
		percentile = (100-x)/100
		if quadgk(k-> pdf(px(10),k),(-Inf,i)...)[1] >= percentile
			var=i
			break
		end
	end
	return var
end

# ╔═╡ 9da6f513-025d-4a91-ae63-96ec5e1888ba
rand_val = rand(1:100)

# ╔═╡ d3b48998-09da-417e-a063-7a32a86f6b4d
begin
	n_ = OneSidedTail_Normal(rand_val)
	t_ = OneSidedTail_TDist(rand_val)
	(n_, t_)
end

# ╔═╡ e10a65ab-55ea-4b49-a918-0aaf2707dc88
begin
	Dist_norm = qx()
	Dist_t = px(10)
end

# ╔═╡ aed782cc-2e81-4c61-adc8-ecdec4d41ef0
begin
	plot(-10:0.01:10,[pdf(Dist_norm,p) for p in -10:0.01:10], label="Normal Distribution")
	plot!(-10:0.01:10,[pdf(Dist_t,p) for p in -10:0.01:10], label="T Distribution")
end

# ╔═╡ 0aab5b78-a8c2-45f3-b2d3-9351e0337ecb
val_ = 100-rand_val

# ╔═╡ d63a9df5-c2b1-44c5-b6bb-0f488badb551
begin
	plot(-10:0.01:10,[pdf(Dist_norm,k) for k in -10:0.01:10], label="Normal Distribution",legend=:topleft)
	plot!(-10:0.01:10,[pdf(Dist_t,k) for k in -10:0.01:10], label="T Distribution")
	plot!(-10:0.01:n_,[pdf(Dist_norm,k) for k in -10:0.01:n_], fill=(0,:red),label="Area of Normal Distribution")
	plot!(-10:0.01:t_,[pdf(Dist_t,k) for k in -10:0.01:t_], fill=(0,:lightblue),label="Area of T Distribution")
	plot!([n_,n_],[0,pdf(Dist_norm,n_)],label=string(val_)*" Percentile-Normal-Dist", line=(2,:dash, :blue))
	plot!([t_,t_],[0,pdf(Dist_t,t_)],label=string(val_)*" Percentile-T-Dist", line=(2,:dash, :red))
end

# ╔═╡ b8ee01a8-1e75-461a-974f-561a3d8610ad
md"👉 Comparing the plots for x=95"

# ╔═╡ 19f6937a-f26b-47be-b56c-cc47a573f521
begin
	n_95 = OneSidedTail_Normal(95)
	t_95 = OneSidedTail_TDist(95)
	(n_95, t_95)
end

# ╔═╡ bb586a0d-1b69-4c88-a092-10534ef53c00
begin
	plot(-10:0.01:10,[pdf(Dist_norm,p) for p in -10:0.01:10], label="Normal Distribution",legend=:topleft)
	plot!(-10:0.01:10,[pdf(Dist_t,p) for p in -10:0.01:10], label="T Distribution")
	plot!(-10:0.01:n_95,[pdf(Dist_norm,p) for p in -10:0.01:n_95], fill=(0,:red),label="Area of Normal Distribution")
	plot!(-10:0.01:t_95,[pdf(Dist_t,p) for p in -10:0.01:t_95], fill=(0,:lightblue),label="Area of T Distribution")
	plot!([n_95,n_95],[0,pdf(Dist_norm,n_95)],label=string(5)*" Percentile-Normal-Dist", line=(2,:dash, :blue))
	plot!([t_95,t_95],[0,pdf(Dist_t,t_95)],label=string(5)*" Percentile-T-Dist", line=(2,:dash, :red))
end

# ╔═╡ Cell order:
# ╠═882ef94d-6765-40f5-93d3-3facaa5d9a31
# ╟─a1e0c9a0-955e-11eb-00cc-df6225dab69a
# ╠═560d7a1d-8957-4ac4-b0db-5e0b696226e4
# ╠═fded008e-d16b-4b52-a545-ee9f9ca52932
# ╠═9306b136-5804-407f-ae7a-5890d23bbc35
# ╠═45d1e58f-aec6-4b6c-922a-8fcfa3a3e823
# ╟─5c9ac826-ae1a-485e-8b64-f7d1fd82fbc5
# ╠═9a6aff3a-dcec-4f56-a565-fbbf9295de49
# ╠═f4527eb1-6fbb-4918-85d3-2c72a4bcf0c5
# ╠═d9ab180a-08b6-4a7a-83d2-8a406aaddfcf
# ╠═5fd53ca6-721d-4e21-86e5-4f4d43747f90
# ╠═172d982a-e72b-4a5e-9769-d6b9a56ae25e
# ╠═c350ccf1-44c5-435e-ad42-f5d03cad7dbd
# ╟─a29c8480-c9e1-4d57-a714-f1c930378fb9
# ╠═a4d9406f-fc23-4d70-9ddd-7b9750c46b19
# ╠═a56c0f6a-6ab0-4f90-a3da-ef851ddf1d70
# ╠═32a0fc39-37d1-4b88-8fca-440b5dee4f9c
# ╠═5310fe4d-f1e6-49e9-ab26-9a137e2b3762
# ╠═a43b6bb0-717d-4d95-9cc1-47c839ebee70
# ╠═4ec31cee-3db7-44a1-8285-4c97a9252186
# ╠═d8b8885a-4932-483a-9263-8574467ae1c1
# ╠═16fc51a8-42df-415d-a7b9-61ee40c01b44
# ╠═b4de3a3f-1108-42f2-8d67-9ce5866ad381
# ╠═90bc485d-6aef-4253-99db-69191d15215f
# ╟─16769103-d5bc-4ff5-a1b8-ffb338f89ca4
# ╠═3401d449-5e35-44a0-98c7-265de48dbfd7
# ╠═7014470c-14cb-40a1-a28f-68cad20bd8c4
# ╠═33796384-ac65-45a3-bedb-6e96d27f2ad1
# ╠═ad50fd22-45c4-4c95-8fbb-338ff444d0d6
# ╠═5c92151e-ee68-4ed9-a758-4dfff602e26f
# ╟─8436bd55-5048-47ab-ab52-01b949fa7724
# ╠═b2ab1a19-119b-4866-abff-bebab56147ef
# ╠═940948b1-7475-4179-9b00-dad0be00d157
# ╠═17f29e4d-aeb7-4634-9e55-c11aaf8ab2a1
# ╠═785d2702-9ea2-4843-8144-f27176df810f
# ╠═744f692e-6cf9-498c-a0c5-6880ac24ac02
# ╠═1eacf6e3-82c9-4e9e-8c72-5c34cc6e2387
# ╠═98f502fe-8c2a-4829-832a-44410c8b0c33
# ╠═54baf531-eafc-4d11-afd9-4790d2ab58cb
# ╠═3ca103a0-f38a-421d-8056-6f61320addae
# ╠═b5e883a3-76cc-4154-b8db-5940725d0178
# ╠═d47b3b97-81ee-4c34-b549-ed5d247135fb
# ╠═d4a0ac56-fd2b-4f41-9ac7-b869d7e5da9c
# ╠═a7d62349-700d-41c6-9c83-a1ae2b6306ce
# ╠═5c373657-bd60-40f0-b64f-a5357b582e96
# ╠═8cfd6104-2c3c-473c-91bc-bcbe73fd2382
# ╠═89031de0-4cf6-4d4a-8e01-db738dcb85d8
# ╠═81518534-e03b-4dc8-8bac-b4ffe8ed3078
# ╠═6a54101b-3a58-49d6-bb64-1e91d0d762c0
# ╠═fa09d5b4-f201-4117-a8d2-468c22603b14
# ╠═029aaf7e-cb98-4d88-a857-fe76b80093e7
# ╠═e403fa82-a567-4625-b247-69485bf05617
# ╠═481c7582-9208-4dc2-b117-9a3b015cea71
# ╠═efd626aa-681f-4640-be7f-0e4584cbabb6
# ╟─ee7953a4-cfda-4b23-9943-1c49a0375fcc
# ╠═4415d906-f4a3-4b2b-9100-b40bc05c5bc2
# ╠═4dc90419-74dc-4916-9cd5-56204f6deda2
# ╠═9da6f513-025d-4a91-ae63-96ec5e1888ba
# ╠═d3b48998-09da-417e-a063-7a32a86f6b4d
# ╠═e10a65ab-55ea-4b49-a918-0aaf2707dc88
# ╠═aed782cc-2e81-4c61-adc8-ecdec4d41ef0
# ╠═0aab5b78-a8c2-45f3-b2d3-9351e0337ecb
# ╠═d63a9df5-c2b1-44c5-b6bb-0f488badb551
# ╟─b8ee01a8-1e75-461a-974f-561a3d8610ad
# ╠═19f6937a-f26b-47be-b56c-cc47a573f521
# ╠═bb586a0d-1b69-4c88-a092-10534ef53c00
