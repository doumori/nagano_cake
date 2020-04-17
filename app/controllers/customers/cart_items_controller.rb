class Customers::CartItemsController < ApplicationController
  def index
    @cartitem = CartItems.find(params[:id])
  end

  def create
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