class UsersController < ApplicationController


  get '/signup' do
    erb :signup
  end

  post 'users' do
    binding.pry
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/"
    else
      erb :signup
    end
  end
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

end