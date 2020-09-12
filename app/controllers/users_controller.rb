class UsersController < ApplicationController

  get "/login" do
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "user/#{@user.id}"
    else

    end

  end

  get '/signup' do
    erb :'users/signup'
  end

  post 'signup' do
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/"
    else
      erb :'users/signup'
    end
  end
  
  get '/users/show' do 
      erb :'users/show'
  end


end