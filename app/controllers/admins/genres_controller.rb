class Admins::GenresController < ApplicationController

  def index
  	@genres = Genre.all
  	@newgenre = Genre.new
  end

  def create
  	@newgenre = Genre.new(genre_params)
  	if @newgenre.save
  		redirect_to admins_genres_path, notice: "successfully created Genre!"
  	else
  		@genres = Genres.all
  		render admins_genres_path
  	end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admins_genres_path, notice: "successfully created Genre!"
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path, notice: "successfully delete genre!"
  end


  private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
