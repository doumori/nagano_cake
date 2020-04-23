class ItemsController < ApplicationController
  def index
     @items_all = Item.all
    # 消費税の計算。うまくいかない
    @tax = (1.1.to_i).round
    @order_confirm = Order.new
    @genres=Genre.all
        if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8).order('updated_at DESC')
    else
      @items = Item.page(params[:page]).per(8).order('updated_at DESC')
    end
  end
  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
    @genres=Genre.all
    # 消費税の計算。これは上手く行く
  end
  def top
    @push_items = Item.last(2)
  end
  private
  def item_params
    params.require(:item).permit(:genre_id, :description, :name, :price, :image_id, :is_sale_status)
  end
end