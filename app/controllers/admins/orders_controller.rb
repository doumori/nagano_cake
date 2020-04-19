class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
<<<<<<< HEAD
  	@order=Order.find(params[:id])
    @order_items=@order.order_items
    @sum=100
    @freight=800
    @total=@freight+@sum
=======
    @order_items = OrderItem.all
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])
    @order_item = OrderItem.find(params[:id])
>>>>>>> master
  end


  def update
<<<<<<< HEAD
  	@cart_item=CartItem.find(params[:cart_item_id])
  end
  private
  def order_params
  	params.require(:order).permit(:customer_id, :total,:freight, :total, :pay_method, :status,:ship_name,:ship_postcode,:ship_address)
=======
  	@order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_orders_path

    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admins_order_path(@order.id)

  end
  private
  def order_params
  	params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
>>>>>>> master
  end
end