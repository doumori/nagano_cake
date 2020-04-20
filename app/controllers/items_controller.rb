class ItemsController < ApplicationController
  def index
    @items = Item.all
    @order_confirm = Order.new
  end

  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
  end

  def top
    @push_items = Item.last(5)
  end

  private
  def customer_params
    params.require(:cart_item).permit(:genre_id, :description, :name, :price, :image_id, :is_sale_status)
  end
end