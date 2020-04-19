class Admins::GenresController < ApplicationController

  def index
  	@genres = Genre.all
  	@newgenre = Genre.new
  end

  def create
  	@newgenre = Genre.new
  	if @newgenre.save #入力されたデータをdbに保存する。
  		redirect_to admins_genres_path, notice: "successfully created Genre!"#保存された場合の移動先を指定。
  	else
  		@genres = Genres.all
  		render admins_genres_path
  	end
  end

  def edit
  	@genre=Genre.find(params[:id])
  end
  private
   def genre_params
    params.require(:genre).permit(:name,:is_active)
  	@genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.save #入力されたデータをdbに保存する。
      redirect_to admins_genres_path, notice: "successfully created Genre!"#保存された場合の移動先を指定。
    else
      @genres = Genres.all
      render admins_genres_path
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path, notice: "successfully delete genre!"
  end

end
