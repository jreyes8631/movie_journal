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
    @movie = current_user.movies.build(title: params[:movie][:title], description: params[:movie][:description])
    if @movie.save
      redirect "/movies"
    else
      erb :"/movies/new.html"
    end
  end

  get "/movies/:id" do
    @movie = Movie.find(params[:id])
    erb :"/movies/show.html"
  end
    
  get "/movies/:id/edit" do
    set_movie
    redirect_if_not_authorized
    erb :"/movies/edit.html"
  end

  patch "/movies/:id" do
    set_movie
    redirect_if_not_authorized
    if @movie.update(title: params[:movie][:title], description: params[:movie][:description])
      flash[:success] = "Post successfully updated"
      redirect "/movies/#{@movie.id}"
    else 
      erb :"/movies/edit.html"
    end
  end

  delete "/movies/:id" do
    set_movie
    redirect_if_not_authorized
    @movie.destroy
    redirect "/movies"
  end

  private 

  def set_movie 
    @movie = Movie.find_by_id(params[:id])
    if @ovie.nil?
      flash[:error] = "Couldn't find a Movie with id: #{params[:id]}"
      redirect "/movies"
    end
  end

  def authorize_movie(movie)
    current_user == movie.user
  end

end