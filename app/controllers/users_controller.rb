class UsersController < ApplicationController


  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else 
      @error = "User name or email already taken"
      erb :'users/signup'
    end
  end

  get '/users/:id' do
    redirect_if_not_logged_in
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

end