require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

# Return "Hello World!" string when we get root
get "/" do
  "Hello World!"
end

# return a form when we hit the '/hello/' route

get '/hello/' do
  erb :hello_form
end

# Return index when we post to /hello/ endpoint, which can process params
# greeting and name. 

post '/hello/' do
  greeting = params[:greeting] || "Hi There"
  name = params[:name] || "Nobody"

  erb :index, :locals => {'greeting' => greeting, 'name' => name}
end


