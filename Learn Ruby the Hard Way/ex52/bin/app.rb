require 'sinatra'
require './lib/gothonweb/map.rb'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'WALRUS'

# Return "Hello World!" string when we get root
get "/" do
  session[:room] = 'START'
  redirect to('/game')
end

# return a form when we hit the '/hello/' route

get '/game' do
  room = Map::load_room(session)

  if room
    erb :show_room, :locals => {:room => room}
  else
    erb :you_died
  end
end

post '/game' do
  room = Map::load_room(session)
  action = params[:action]

  if room
    next_room = room.go(action) || room.go('*')

    if next_room
      Map::save_room(session, next_room)
    end

    redirect to('/game')
  else
    erb :you_died
  end
end
