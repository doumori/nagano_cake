class ItemsController < ApplicationController
  def index
    @items = Item.all
    # 消費税の計算。うまくいかない
    @tax = (1.1.to_i).round
    @order_confirm = Order.new
  end

  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
    # 消費税の計算。これは上手く行く
    @tax_item = @item.price * 1.1
  end

  def top
    @push_items = Item.last(5)
  end

  private
  def customer_params
    params.require(:cart_item).permit(:genre_id, :description, :name, :price, :image_id, :is_sale_status)
  end
end