class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
    @order_items = OrderItem.all
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])

    @freight=800
  end


  def update
  	@order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_orders_path
  end




  private
  def order_params
  	params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end

end