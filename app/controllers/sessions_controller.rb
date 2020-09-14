class SessionsController < ApplicationController
    get '/login' do
     erb :'/sessions/login'
    end

    post '/login' do

      user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password]) 
         session[:user_id] = user.id
         flash[:success] = "log in successfully"
         redirect "/"
        else
            @error = "Incorrect email or password"
            erb :'/sessions/login'
        end
    end


    delete '/logout' do 
        session.clear
        flash[:success] = "Log out successfully, Come back soon!"
        redirect "/"
    end

end