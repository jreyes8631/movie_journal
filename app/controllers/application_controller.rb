require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

 private

  def current_user
   @current_user = User.find_by(id: session[:user_id])
  end
   
  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view that page"
      redirect request.referrer || "/login"
     end
  end

   


  

end
