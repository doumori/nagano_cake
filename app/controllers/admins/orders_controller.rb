class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @freight=800
  end

  def update
  	@order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_order_path(@order.id)
  end

  private
  def order_params
  	params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
  def order_item_params
    params.require(:order_item).permit(:sat)
  end
end
