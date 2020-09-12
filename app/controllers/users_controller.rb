class UsersController < ApplicationController

  get "/login" do
    erb :login
  end

  get '/signup' do
    erb :'users/signup'
  end

  post 'signup' do
    @user = User.new(name: params[:email], password: params[:password])
    binding.pry
    if @user.save
      
    else
      erb :'users/signup'
    end
  end
  
end