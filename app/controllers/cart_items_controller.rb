class CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.find(params[:id])
  end

  def create
    @item = Item.find_by(params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = @item.id
    redirect_to new_order_path
  end

  def destroy
  end

  def update
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_quantity)
  end
end