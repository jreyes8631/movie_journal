class UsersController < ApplicationController


  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:id] = @user.id
      flash[:success] = "User successfully created"
      redirect "/users/#{@user.id}"
    else 
      @error = "User name or email already taken"
      erb :'users/signup'
    end
  end

  get '/users/:id' do
    if
     @user = User.find_by(id: params[:id])
     erb :'/users/show'
    else
      @error = "That user does not exist"
      redirect '/'
    end
  end

end