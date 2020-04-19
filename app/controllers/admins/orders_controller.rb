class Admins::OrdersController < ApplicationController
  def index
  	@orders=Order.all
  end

  def show
  	@order=Order.find(params[:id])
    @order_items=@order.order_items
    @sum=100
    @freight=800
    @total=@freight+@sum
  end


  def update
  	@cart_item=CartItem.find(params[:cart_item_id])
  end
  private
  def order_params
  	params.require(:order).permit(:customer_id, :total,:freight, :total, :pay_method, :status,:ship_name,:ship_postcode,:ship_address)
  end
end