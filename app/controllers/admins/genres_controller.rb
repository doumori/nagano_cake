class Admins::GenresController < ApplicationController
  def index
  	@genres = Genre.all
  	@newgenre = Genre.new
  end

  def update
  	@genre = Genre.find(params[:id])
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
  	@genre = Genre.find(params[:id])
  end
end
