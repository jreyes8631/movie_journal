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
      erb :signup
    end

  end

  get '/signup' do
    erb :signup
  end

  post 'signup' do
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "user/#{@user.id}"
    else
      erb :'signup'
    end
  end
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

end