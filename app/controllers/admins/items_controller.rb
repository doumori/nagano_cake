class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genres, only: [:index, :new, :edit, :create,:update]


  def index
    @items=Item.all
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path
    else
      render :index
    end
  end

  def create

    item = Item.new(item_params)
    if item.save
      redirect_to admins_items_path
    else
      @items = Item.all
      render :index

    end
  end

  def new
    @item = Item.new
  end

  def show
     @item=Item.find(params[:id])
      @tax = @item.price.to_i*1.1
  end

  def edit
      @item=Item.find(params[:id])
  end

  private
    def item_params
    params.require(:item).permit(:name,:description,:image,:price,:is_sale_status,:genre_id)
  end
  def set_genres
    @genres = Genre.all
  end
end
