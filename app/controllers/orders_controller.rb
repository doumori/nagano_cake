class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
  end

  def show
  end

  def confirm
    @order = order_item.find_by(params[:order_id])
    @cart_item = CartItem.find(params[:cart_item_id])
    @order = Crder.new(order_params)
    @order.customer_id = current_customer.id
    render 'order/thanks'
  end

  def thanks
  end

  def index
  end

  def order_params
    params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
end