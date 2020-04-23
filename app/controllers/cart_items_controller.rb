class CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @order_new = Order.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
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
    if @cart_item_destroy_all.destroy_all
      redirect_to items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_quantity)
  end
end