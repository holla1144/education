require './bin/app.rb'
require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_hello_form
    get '/game'
    assert last_response.ok?
  end

  def test_hello_form_post
    post '/game', params={:action => 'Shoot!'}
    assert last_response.ok?
  end
end