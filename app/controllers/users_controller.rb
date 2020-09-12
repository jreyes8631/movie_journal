class UsersController < ApplicationController


  get '/signup' do
    erb :'users/signup'
  end

  post 'users' do
    binding.pry
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/"
    else
      erb :'users/signup'
    end
  end
  

end