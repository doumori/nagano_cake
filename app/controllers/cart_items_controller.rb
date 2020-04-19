class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @cart_item = current_customer.cart_items.find(params[:id])
  end

  def create
    @item = Item.find_by(params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = @item.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id],cart_item_id: params[:cart_item_id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def update
    @cart_item_up.update(cart_item_params)
    @cart_item_up = CartItem.update(cart_item_params)
    CartItem.find(params[:id]).update(cart_item_params)
  end

  def destroy_all
    @cart_item_destroy_all = CartItem.all
    @cart_item_destroy_all.destroy.all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_quantity)
  end
end