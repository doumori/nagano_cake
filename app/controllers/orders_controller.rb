class OrdersController < ApplicationController
  def new
    @order_new = Order.new
    @by_address = current_customer.address
    @ships = current_customer.ships
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
      if  @order.save
        redirect_to orders_thanks_path
      else
        render 'customers/new'
      end
  end

  def show
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order_new = Order.new(order_params)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
  end

  def thanks
  end

  def index
  end

  def order_params
    params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
end