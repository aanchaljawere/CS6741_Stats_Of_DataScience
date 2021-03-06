### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ c7903cf0-7cac-11eb-185f-5f4f6cad6b53
using DataFrames

# ╔═╡ d19ae2e0-7cac-11eb-0911-198ac22e4dd6
begin
	using Dates
	using Random
end

# ╔═╡ bb619d40-7e67-11eb-2aec-9569aa775b6e
begin
	using HTTP
	using JSON
	using CSV
	using Statistics
end

# ╔═╡ c0f125e0-7e68-11eb-02fb-7314f094f94b
using Plots

# ╔═╡ d19cb7a0-7cac-11eb-029b-7361367f5be7
## Question 1 ##

# ╔═╡ d19cb7a0-7cac-11eb-3376-43611b659740
begin
df1 = DataFrame(
Symbol("Religion") => ["Agnostic","Atheist","Buddhist","Catholic","Don't know refused","Evangelical Prot","Hindu","Historically Black Prot","Jevohah's Witness","Jewish"], 
Symbol("<\$10k") => rand(1:1000,10),
Symbol("\$10-20k") => rand(1:1000,10),
Symbol("\$20-30k") => rand(1:1000,10),
Symbol("\$30-40k") => rand(1:1000,10),
Symbol("\$40-50k") => rand(1:1000,10),
Symbol(">\$50k") => rand(1:1000,10)
)
df1
end

# ╔═╡ 03cbb982-7d0a-11eb-253c-8b5a7a004b6a
TidyDataStacked = DataFrames.stack(df1, 2:7,:Religion)

# ╔═╡ 094899ee-7d0a-11eb-13c1-f14023cdc087
rename!(sort(TidyDataStacked),[:Religion, :Income, :Frequency])

# ╔═╡ fe04f3f0-7e6b-11eb-0503-55cb0475deb9


# ╔═╡ d19ae2e0-7cac-11eb-2321-e576b897e667
## Question  2 ##

# ╔═╡ d19ae2e0-7cac-11eb-2942-d98129f7878b
df2 = DataFrame(Id = String[], Year = Int[], Month = Int[], Element = String[], d1 = Union{Missing, Int}[], d2 = Union{Missing, Int}[], d3 = Union{Missing, Int}[], d4 = Union{Missing, Int}[],d5 = Union{Missing, Int}[], d6 = Union{Missing, Int}[], d7 = Union{Missing, Int}[], d8 = Int[], d9 = Union{Missing, Int}[], d10 = Union{Missing, Int}[], d11 = Union{Missing, Int}[], d12 = Union{Missing, Int}[], d13 = Union{Missing, Int}[], d14 = Union{Missing, Int}[], d15 = Union{Missing, Int}[], d16 = Union{Missing, Int}[], d17 = Union{Missing, Int}[], d18 = Union{Missing, Int}[], d19 = Union{Missing, Int}[], d20 = Int[], d21 = Union{Missing, Int}[], d22 = Union{Missing, Int}[], d23 = Union{Missing, Int}[], d24 = Union{Missing, Int}[], d25 = Union{Missing, Int}[], d26 = Union{Missing, Int}[], d27 = Union{Missing, Int}[], d28 = Union{Missing, Int}[], d29 = Union{Missing, Int}[], d30 = Union{Missing, Int}[] )

# ╔═╡ d19ae2e0-7cac-11eb-130b-7d05cd379b98
begin
	val_id = ["MX17004", "MX17005", "MX17006"]
	val_year = [2009,2010]
end

# ╔═╡ c29e4b80-7cb9-11eb-2817-4ddc5fcd7260
for i in 1:5
	id = rand(val_id)
	yr = rand(val_year)
	month = i
	push!(df2,(id, yr, month, "tmax", rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40), rand(30:40) ))
	push!(df2,(id, yr, month, "tmin", rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20), rand(10:20) ))
end

# ╔═╡ d19ae2e0-7cac-11eb-2710-d7aabc797449
df2

# ╔═╡ d1993530-7cac-11eb-3aa4-7d4c3894404d
# inserting missing values randomly
begin
	rand_val =[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,2,24,25,26,27,28,29,30]
	rand_index = [2*rand(1:5)-1 for i in 1:10]
	rand_date = ["d"*string(rand(rand_val)) for i in 1:10]
end

# ╔═╡ 5266caa0-7cc2-11eb-0896-9966847c6b55
for i in 1:10
	x = rand_index[i]
	y = Symbol(rand_date[i])
	df2[x,y] = missing
	df2[x+1,y] = missing
end

# ╔═╡ 9f5c8800-7cad-11eb-08e5-35c368ab6131
df2

# ╔═╡ b730ce50-7cc6-11eb-061e-4dcbc8fe0039
gdf = groupby(df2,:Month)

# ╔═╡ b5826260-7cc3-11eb-3239-fb326995e4ec
df_id_year_month_combo = combine(gdf, [:Id, :Year, :Month] => ((i, y, m)->(i[1],y[1],m[1]))=>"Id_Year_Month",:Element,:d1,:d2,:d3,:d4,:d5,:d6,:d7,:d8,:d9,:d10,:d11,:d12,:d13,:d14,:d15,:d16,:d17,:d18,:d19,:d20,:d21,:d22,:d23,:d24,:d25,:d26,:d27,:d28,:d29,:d30)

# ╔═╡ a6a4aa30-7cbb-11eb-11a6-75e7c848acaf
stacked_df2 = DataFrames.stack(df_id_year_month_combo,4:33,:Id_Year_Month)

# ╔═╡ a67a8cf0-7cbb-11eb-2e85-0b9ff0488e27
stacked_df2_no_missing = dropmissing(stacked_df2)

# ╔═╡ 9ec6b0a0-7cad-11eb-0642-f1c41e58bc86
rename!(stacked_df2_no_missing,:variable => :Days)

# ╔═╡ aa02d1b0-7cad-11eb-12b3-0111c694ad25
gdf2 = groupby(stacked_df2_no_missing,[:Id_Year_Month,:Days])

# ╔═╡ a9d3ab60-7cad-11eb-3265-cbebfb64bc05
gdf2_combined = combine(gdf2,:value => (x -> [extrema(x)]) => [:tmin, :tmax])

# ╔═╡ 1ed76b40-7cae-11eb-1b0e-5de00ca66fe6
gdf2_combined2 = groupby(gdf2_combined,[:Id_Year_Month,:Days])

# ╔═╡ cedc2520-7cb9-11eb-1540-8100c8989662
gdf2_combined3 = combine(gdf2_combined2, [:Id_Year_Month, :Days] => ((i, d)->(i[1],d[1]))=>"Id_Year_Month_Days",:tmin,:tmax)

# ╔═╡ d698f570-7e64-11eb-0fdc-fb6db8aa92dd
gdf2_fin = select(gdf2_combined3,Not([:Id_Year_Month,:Days]))

# ╔═╡ fc6b6c5e-7e64-11eb-1881-21d0b3c945e6
begin
	function get_id(x)
	    id_ = []
		len = length(x)
	    for i in 1:len
	        push!(id_,x[i][1][1])
	    end
	    return id_
	end
	
	function date_convertor(x)
	    date_ = []
		len = length(x)
	    for i in 1:len
			date = x[i][2][2:end]
			year = x[i][1][2]
	        month = x[i][1][3]
	        push!(date_,"$year-$month-$date")
	    end
	    return date_
	end
end

# ╔═╡ fc360480-7e64-11eb-0c9b-53904ccdf8f4
final_tidy_df = select(gdf2_fin,:Id_Year_Month_Days=> (x -> get_id(x)) =>"Id", :Id_Year_Month_Days=> (x-> date_convertor(x)) => "Date", :tmax,:tmin)

# ╔═╡ 336f9740-7e65-11eb-1400-9f837fa91e24


# ╔═╡ 33396c10-7e65-11eb-39ec-e52524e3c3f4
## Question 3##

# ╔═╡ 33075f90-7e65-11eb-050c-af9a8c6bfbbf
begin
	df3 = DataFrame(
		Year_   = [2000 for _ in 1: 15], 
		Artist  = ["2pac","2pac","2pac","2pac","2pac","2pac","2pac","2Ge+her","2Ge+her","2Ge+her","3 Doors Down","3 Doors Down","3 Doors Down","3 Doors Down","3 Doors Down"], 
		Time_  = [0:0 for _ in 1: 15],
		Track = ["" for _ in 1: 15],
		Date_ = [Date(2000,02,26), Date(2000,03,04), Date(2000,03,11), Date(2000,03,18), Date(2000,03,25), Date(2000,04,01), Date(2000,04,08), Date(2000,09,02), Date(2000,09,09), Date(2000,09,16), Date(2000,04,08), Date(2000,04,15), Date(2000,04,22), Date(2000,04,29), Date(2000,05,06)],
		Week_ = [0 for _ in 1: 15],
		Rank = [87,82,72,77,87,94,99,91,87,92,81,70,68,67,66]
	)
	
	#updation in values of the attributes
	for i in 1:15
		if i <=7
			df3.Time_[i] = 4:22
		elseif i>7 && i<11
			df3.Time_[i] = 3:15
		else
			df3.Time_[i] = 3:53
		end
	end
	
	for i in 1:15
		if i <=7
			df3.Track[i] = "Baby Don't Cry"
		elseif i>7 && i<11
			df3.Track[i] = "The Hardest Part Of..."
		else
			df3.Track[i] = "Kryptonite"
		end
	end
	
	for i in 1:15
		if i <=7
			df3.Week_[i] = i
		elseif i==8 || i==11
			df3.Week_[i] = 1
		elseif i==9 || i==12
			df3.Week_[i] = 2
		elseif i==10 || i==13
			df3.Week_[i] = 3
		elseif i==14
			df3.Week_[i] = 4
		else
			df3.Week_[i] = 5
		end
	end
	df3
end

# ╔═╡ 32d83940-7e65-11eb-3575-eb42936dd05f
insertcols!(df3, 1, :Id => 1:15, makeunique=true)

# ╔═╡ 32a7653e-7e65-11eb-0236-6bae436f5c1f
df_unique3 = unique(df3,:Artist)

# ╔═╡ 32769140-7e65-11eb-37a6-bf96da3c7328
begin
	select!(df_unique3, Not(:Year_))
	select!(df_unique3, Not(:Date_))
	select!(df_unique3, Not(:Week_))
	select!(df_unique3, Not(:Rank))
	select!(df_unique3, Not(:Id))
end

# ╔═╡ 32493fb0-7e65-11eb-2f02-270cb96d4f32
insertcols!(df_unique3, 1, :Id => 1:3, makeunique=true)

# ╔═╡ 32195610-7e65-11eb-1a88-8366e0aa8b2a
df_left3 = df_unique3[:, [:Id,:Artist,:Track,:Time_]]

# ╔═╡ 31e0b9e0-7e65-11eb-1f44-9515f7416c77
df_join3 = innerjoin(df_left3, df3, on = :Artist, makeunique=true)

# ╔═╡ 31b56420-7e65-11eb-3edf-3d60c9e30469
df_right3 = df_join3[:, [:Id,:Date_,:Rank]]

# ╔═╡ 3189e750-7e65-11eb-3700-e75a4f558cbc


# ╔═╡ 315c208e-7e65-11eb-1c7a-67c337194a0b
## Question 4##

# ╔═╡ bb386a60-7e67-11eb-05d8-595ff1a8771f
url = "https://api.covid19india.org/data.json"

# ╔═╡ bb06ac00-7e67-11eb-1a3e-9d533b885183
response_ = HTTP.request("GET",url)

# ╔═╡ bada44d2-7e67-11eb-28fe-1bb6637c2c2e
str = String(response_.body)

# ╔═╡ baa88670-7e67-11eb-04c9-3116a713b24c
jobj = JSON.Parser.parse(str)

# ╔═╡ ba784eb0-7e67-11eb-157a-45e6cb064c03
df4 = reduce(vcat, DataFrame.(jobj["cases_time_series"]))

# ╔═╡ ba47c8d0-7e67-11eb-2716-558176b5ba9a
begin
	df4.Date = Date.(df4.dateymd, "yyyy-mm-dd")
	df4[!,:Dailyconfirmed] = parse.(Int,df4[!,:dailyconfirmed])
	df4[!,:Dailydeceased] = parse.(Int,df4[!,:dailydeceased])
	df4[!,:Dailyrecovered] = parse.(Int,df4[!,:dailyrecovered])
	df4[!, :YearMonth] = yearmonth.(df4[!, :Date])
end

# ╔═╡ bc936680-7e67-11eb-356b-853f1c286f65
df4

# ╔═╡ bc591ca0-7e67-11eb-1fde-b37ee26be352
gdf4 = groupby(df4,:YearMonth)

# ╔═╡ f4074320-7e67-11eb-0b26-e1a5db22baa1
begin
	select!(df4, Not(:dateymd))
	select!(df4, Not(:dailyconfirmed))
	select!(df4, Not(:dailydeceased))
	select!(df4, Not(:dailyrecovered))
end

# ╔═╡ f3b7eaa0-7e67-11eb-1513-595516ede40b
df4_fin = combine(gdf4, :Dailyconfirmed => sum, :Dailydeceased => sum, :Dailyrecovered => sum)

# ╔═╡ f37aba90-7e67-11eb-26d8-a3775c09f59d


# ╔═╡ 35397a72-7e68-11eb-0559-4d3df1d4f21e
## Question 5##

# ╔═╡ 35037650-7e68-11eb-10bd-a73eac19248f
df5 = df4

# ╔═╡ 34d9a730-7e68-11eb-125b-27786c0d9fc0
begin
	insertcols!(df5,1,:moving_avg_confirmed=>[0.0 for _ in 1:401 ],:moving_avg_deceased=>[0.0 for _ in 1:401],:moving_avg_recovered=>[0.0 for _ in 1:401],makeunique=true)
end

# ╔═╡ 34ac2e90-7e68-11eb-3627-efcbe91803f6
begin
	for i in 1:6
		df5.moving_avg_confirmed[i] = 0
		df5.moving_avg_deceased[i] = 0
		df5.moving_avg_recovered[i] = 0
	end
	for i in 7:401
		sum1 = df5.Dailyconfirmed[i]
		sum2 = df5.Dailydeceased[i]
		sum3 = df5.Dailyrecovered[i]
		for j in i-6:i-1
			sum1 += df5.Dailyconfirmed[j]
			sum2 += df5.Dailydeceased[j]
			sum3 += df5.Dailyrecovered[j]
		end
		ans1 = sum1/7
		ans2 = sum2/7
		ans3 = sum3/7
		df5.moving_avg_confirmed[i] = ans1
		df5.moving_avg_deceased[i] = ans2
		df5.moving_avg_recovered[i] = ans3
	end
end

# ╔═╡ 347985d0-7e68-11eb-0e72-9520d9557a9d
df5

# ╔═╡ f7c6c6b0-7e68-11eb-12fa-6f2c37014199
plot(df4.Date,df4.Dailyconfirmed,xlabel = "Date", ylabel = "Confirmed Cases", label = "daily_confirmed")

# ╔═╡ f7832e00-7e68-11eb-08c4-13e182ec9916
plot(df4.Date,df4.Dailydeceased,xlabel = "Date", ylabel = "Deceased Cases", label = "daily_deceased")

# ╔═╡ f6de1460-7e68-11eb-2285-4358e12b0da3
plot(df4.Date,df4.Dailyrecovered,xlabel = "Date", ylabel = "Recovered Cases", label = "daily_recovered")

# ╔═╡ f6c61f90-7e68-11eb-1d2c-4936cf6031b7
plot(df5.Date,df5.moving_avg_confirmed,xlabel = "Date", ylabel = "Confirmed Cases", label = "moving_avg_confirmed", color = "orange")

# ╔═╡ f698f510-7e68-11eb-22e4-b5a93b32e115
plot(df5.Date,df5.moving_avg_deceased,xlabel = "Date", ylabel = "Deceased Cases", label = "moving_avg_deceased", color = "orange")

# ╔═╡ f6627bc2-7e68-11eb-08b7-edaad88de0f5
plot(df5.Date,df5.moving_avg_recovered,xlabel = "Date", ylabel = "Recovered Cases", label = "moving_avg_recovered", color = "orange")

# ╔═╡ 69e91c10-7e6a-11eb-0235-d7605492406b
#Comparison Plots

# ╔═╡ b36dace0-7e68-11eb-08e2-cd906d67060b
begin
	plot(df4.Date,df4.Dailyconfirmed,xlabel = "Date", ylabel = "Confirmed Cases", label = "daily_confirmed")
	plot!(df5.Date,df5.moving_avg_confirmed,xlabel = "Date", ylabel = "Confirmed Cases", label = "moving_avg_confirmed", color = "orange")
end

# ╔═╡ b334e9a0-7e68-11eb-3445-938477d761c2
begin
	plot(df4.Date,df4.Dailydeceased,xlabel = "Date", ylabel = "Deceased Cases", label = "daily_deceased")
	plot!(df5.Date,df5.moving_avg_deceased,xlabel = "Date", ylabel = "Deceased Cases", label = "moving_avg_deceased", color = "orange")
end

# ╔═╡ b3052710-7e68-11eb-043e-21a98235ec65
begin
	plot(df4.Date,df4.Dailyrecovered,xlabel = "Date", ylabel = "Recovered Cases", label = "daily_recovered")
	plot!(df5.Date,df5.moving_avg_recovered,xlabel = "Date", ylabel = "Recovered Cases", label = "moving_avg_recovered", color = "orange")
end

# ╔═╡ Cell order:
# ╠═c7903cf0-7cac-11eb-185f-5f4f6cad6b53
# ╠═d19cb7a0-7cac-11eb-029b-7361367f5be7
# ╠═d19cb7a0-7cac-11eb-3376-43611b659740
# ╠═03cbb982-7d0a-11eb-253c-8b5a7a004b6a
# ╠═094899ee-7d0a-11eb-13c1-f14023cdc087
# ╠═fe04f3f0-7e6b-11eb-0503-55cb0475deb9
# ╠═d19ae2e0-7cac-11eb-2321-e576b897e667
# ╠═d19ae2e0-7cac-11eb-0911-198ac22e4dd6
# ╠═d19ae2e0-7cac-11eb-2942-d98129f7878b
# ╠═d19ae2e0-7cac-11eb-130b-7d05cd379b98
# ╠═c29e4b80-7cb9-11eb-2817-4ddc5fcd7260
# ╠═d19ae2e0-7cac-11eb-2710-d7aabc797449
# ╠═d1993530-7cac-11eb-3aa4-7d4c3894404d
# ╠═5266caa0-7cc2-11eb-0896-9966847c6b55
# ╠═9f5c8800-7cad-11eb-08e5-35c368ab6131
# ╠═b730ce50-7cc6-11eb-061e-4dcbc8fe0039
# ╠═b5826260-7cc3-11eb-3239-fb326995e4ec
# ╠═a6a4aa30-7cbb-11eb-11a6-75e7c848acaf
# ╠═a67a8cf0-7cbb-11eb-2e85-0b9ff0488e27
# ╠═9ec6b0a0-7cad-11eb-0642-f1c41e58bc86
# ╠═aa02d1b0-7cad-11eb-12b3-0111c694ad25
# ╠═a9d3ab60-7cad-11eb-3265-cbebfb64bc05
# ╠═1ed76b40-7cae-11eb-1b0e-5de00ca66fe6
# ╠═cedc2520-7cb9-11eb-1540-8100c8989662
# ╠═d698f570-7e64-11eb-0fdc-fb6db8aa92dd
# ╠═fc6b6c5e-7e64-11eb-1881-21d0b3c945e6
# ╠═fc360480-7e64-11eb-0c9b-53904ccdf8f4
# ╠═336f9740-7e65-11eb-1400-9f837fa91e24
# ╠═33396c10-7e65-11eb-39ec-e52524e3c3f4
# ╠═33075f90-7e65-11eb-050c-af9a8c6bfbbf
# ╠═32d83940-7e65-11eb-3575-eb42936dd05f
# ╠═32a7653e-7e65-11eb-0236-6bae436f5c1f
# ╠═32769140-7e65-11eb-37a6-bf96da3c7328
# ╠═32493fb0-7e65-11eb-2f02-270cb96d4f32
# ╠═32195610-7e65-11eb-1a88-8366e0aa8b2a
# ╠═31e0b9e0-7e65-11eb-1f44-9515f7416c77
# ╠═31b56420-7e65-11eb-3edf-3d60c9e30469
# ╠═3189e750-7e65-11eb-3700-e75a4f558cbc
# ╠═315c208e-7e65-11eb-1c7a-67c337194a0b
# ╠═bb619d40-7e67-11eb-2aec-9569aa775b6e
# ╠═bb386a60-7e67-11eb-05d8-595ff1a8771f
# ╠═bb06ac00-7e67-11eb-1a3e-9d533b885183
# ╠═bada44d2-7e67-11eb-28fe-1bb6637c2c2e
# ╠═baa88670-7e67-11eb-04c9-3116a713b24c
# ╠═ba784eb0-7e67-11eb-157a-45e6cb064c03
# ╠═ba47c8d0-7e67-11eb-2716-558176b5ba9a
# ╠═bc936680-7e67-11eb-356b-853f1c286f65
# ╠═bc591ca0-7e67-11eb-1fde-b37ee26be352
# ╠═f4074320-7e67-11eb-0b26-e1a5db22baa1
# ╠═f3b7eaa0-7e67-11eb-1513-595516ede40b
# ╠═f37aba90-7e67-11eb-26d8-a3775c09f59d
# ╠═35397a72-7e68-11eb-0559-4d3df1d4f21e
# ╠═35037650-7e68-11eb-10bd-a73eac19248f
# ╠═34d9a730-7e68-11eb-125b-27786c0d9fc0
# ╠═34ac2e90-7e68-11eb-3627-efcbe91803f6
# ╠═347985d0-7e68-11eb-0e72-9520d9557a9d
# ╠═c0f125e0-7e68-11eb-02fb-7314f094f94b
# ╠═f7c6c6b0-7e68-11eb-12fa-6f2c37014199
# ╠═f7832e00-7e68-11eb-08c4-13e182ec9916
# ╠═f6de1460-7e68-11eb-2285-4358e12b0da3
# ╠═f6c61f90-7e68-11eb-1d2c-4936cf6031b7
# ╠═f698f510-7e68-11eb-22e4-b5a93b32e115
# ╠═f6627bc2-7e68-11eb-08b7-edaad88de0f5
# ╠═69e91c10-7e6a-11eb-0235-d7605492406b
# ╠═b36dace0-7e68-11eb-08e2-cd906d67060b
# ╠═b334e9a0-7e68-11eb-3445-938477d761c2
# ╠═b3052710-7e68-11eb-043e-21a98235ec65
