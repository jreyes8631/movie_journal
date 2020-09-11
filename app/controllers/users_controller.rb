class UsersController < ApplicationController

    get "/login" do
      erb :login
    end

    get '/signup' do
      erb :'users/signup'
    end
  
end