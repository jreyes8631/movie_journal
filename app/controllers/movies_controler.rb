class MoviesController < ApplicationController

    get "/movies" do
        @movies = Movie.all
       erb :"/movies/index.html"
    end
    
    get "/movies/new" do
      redirect_if_not_logged_in
      @movie = Movie.new
        erb :"/movies/new.html"
    end

    
end