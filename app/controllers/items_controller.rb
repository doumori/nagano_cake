class ItemsController < ApplicationController

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(10).order('updated_at DESC')
    # 消費税の計算。うまくいかない
    @tax = (1.1.to_i).round
    @order_confirm = Order.new
  end
  def search
    @items=Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
  end

  def top
    @push_items = Item.last(5)
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :description, :name, :price, :image_id, :is_sale_status)
  end
end
