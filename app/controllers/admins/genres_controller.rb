class Admins::GenresController < ApplicationController
  def index
  	@genres=Genre.all
    @genre=Genre.new

  end

  def update
  	genre=Genre.find(params[:id])
  	if genre.update(genre_params)
  		redirect_to 'admins/genres'
  	else
  		render 'index'
  	end
  end

  def create
  	@genre=Genre.new(genre_params)
  	  	if @genre.save
  		redirect_to 'admins/genres'
  	else
  		render 'index'
  	end
  end

  def edit
  	@genre=Genre.find(params[:id])
  end
  private
   def genre_params
    params.require(:genre).permit(:name,:is_active)
  end

end
