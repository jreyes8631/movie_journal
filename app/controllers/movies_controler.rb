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
    @movie = Movie.find(params[:id])
    redirect_if_not_authorized
    erb :"/movies/edit.html"
  end

  patch "/movies/:id" do
    redirect_if_not_authorized
    set_movie
    if @movie.update(params)
      flash[:success] = "Post successfully updated"
      redirect "/movies"
    else 
      erb :"/movies/edit.html"
    end
  end

  delete "/movies/:id" do
    set_movie
    redirect_if_not_authorized
    if @movie.destroy
     flash[:success] = "Movie successfully deleted"
     redirect "/movies"
    else
      erb :"/movies/edit.html"
    end
  end

  private 

  def set_movie
     @movie = Movie.find(params[:id])
  end

  def redirect_if_not_authorized
    redirect_if_not_logged_in
    if !authorize_movie(@movie)
      flash[:error] = "You don't have permission to do that action"
      redirect "/movies"
    end
  end


  def authorize_movie(movie)
    current_user == movie.user
  end

end