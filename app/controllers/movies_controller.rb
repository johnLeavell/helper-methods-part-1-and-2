class MoviesController < ApplicationController
  def new
    @the_movie = Movie.new

    render template: "movies/new"
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html do
        render({ :template => "movies/index" })
      end
    end
  end

  def show
    @the_movie = Movie.find(params.fetch(:id))
    render({ :template => "movies/show" })
  end

  def create
    @the_movie = Movie.new(movie_params)

    if @the_movie.valid?
      @the_movie.save
      redirect_to("/movies", { :notice => "Movie created successfully." })
    else
      render template: "movies/new"
    end
  end

  def edit
    @the_movie = Movie.find(params.fetch(:id))

    render({ :template => "movies/edit" })
  end

  def update
    the_movie = Movie.find(params.fetch(:id))

    the_movie.title = params.fetch("query_title")
    the_movie.description = params.fetch("query_description")

    if the_movie.valid?
      the_movie.save
      redirect_to("/movies/#{the_movie.id}", { :notice => "Movie updated successfully."} )
    else
      redirect_to("/movies/#{the_movie.id}", { :alert => "Movie failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch(:id)
    the_movie = Movie.where({ :id => the_id }).first

    the_movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end

end
