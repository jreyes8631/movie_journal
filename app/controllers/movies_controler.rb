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
  
  post "/movies" do
    redirect_if_not_logged_in
    @movie = current_user.movies.build(title: params[:post][:title], content: params[:post][:content])
    if @post.save
      redirect "/movies"
    else
      erb :"/movies/new.html"
    end
  end

  get "/movies/:id" do
    @movie = Movie.find(params[:id])
    erb :"/movies/show.html"
  end
    
end