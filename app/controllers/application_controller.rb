require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"], password: params["password"])
    session[:user_id] = @user.id
    if Helpers.is_logged_in?(session)
      redirect to '/account'
    else
      redirect to '/'
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do

  end


end

