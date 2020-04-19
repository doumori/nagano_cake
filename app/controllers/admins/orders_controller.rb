class Admins::OrdersController < ApplicationController
  def index
  	@orders=Order.all
  end

  def show
  	@order=Order.find(params[:id])
    @order_items=@order.order_items

  end

  def update
  	@cart_item=CartItem.find(params[:cart_item_id])
  end
  private
  def order_params
  	params.require(:order).permit(:customer_id, :total, :purchase_date, :pay_method, :status)
  end
end