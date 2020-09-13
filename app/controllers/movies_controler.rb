class MoviesController < ApplicationController

    get "/movies" do
        @movies = Movie.all
       erb :"/movies/index.html"
    end
    
    get "/movies/new" do
      
        erb :"/movies/new.html"
    end
end