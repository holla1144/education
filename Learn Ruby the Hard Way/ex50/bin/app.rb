require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

# Return "Hello World!" string when we get root
get "/" do
  "Hello World!"
end

# return a template that takes greeting as a local variable when we
# hit '/hello/' route

get '/hello/' do
  greeting = params[:greeting] || "Hi There"
  erb :index, :locals => {'greeting' => greeting}
end