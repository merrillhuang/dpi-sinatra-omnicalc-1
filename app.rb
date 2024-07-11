require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @number = params.fetch("number")
  @square = @number.to_f ** 2
  erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number = params.fetch("number")
  @square_root = @number.to_f ** 0.5
  erb(:square_root_result)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @result = rand(@min..@max)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  apr = params.fetch("apr").to_f
  @apr = apr.to_fs(:percentage, {:precision => 4})
  @years = params.fetch("years").to_i
  princ = params.fetch("princ").to_f
  @princ = princ.to_fs(:currency)
  apr_percent = apr/100/12
  months = @years * 12
  @payment = ((apr_percent * princ) / (1 - (1+apr_percent)** (-1 * months))).to_fs(:currency)

  erb(:payment_results)
end
