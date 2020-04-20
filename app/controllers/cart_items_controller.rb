class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @order_new = Order.new
    @total_price = CartItem.all.sum(:price)
  end

  def create
    # @item = Item.find(params[:item_id])
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # @cart_item.item_id = @item.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    CartItem.find(params[:id]).update(cart_item_params)
    redirect_to request.referer
  end

  def destroy_all
    @cart_item_destroy_all = current_customer.cart_items.all
    @cart_item_destroy_all.destroy_all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_quantity)
  end
end