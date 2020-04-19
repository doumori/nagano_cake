class OrdersController < ApplicationController
  def new
    @order_new = Order.new
  end

  def create
  end

  def show
  end

  def confirm
    @orders = Order.all

  end

  def thanks
  end

  def index
  end

  def order_params
    params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
end