require './config/environment'

class ApplicationController < Sinatra::Base

   configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get "/" do
    erb :welcome
  end

  helpers do
   
    def looged_in?
      !!current_user
    end

    def current_user
      @current_user = User.find_by(session[:user_id])
    end


  end

end
