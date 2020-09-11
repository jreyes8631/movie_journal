class UsersController < ApplicationController 
    get "/login" do
      erb :login
    end

    get "/singup" do 
       erb :signup
    end
  
end