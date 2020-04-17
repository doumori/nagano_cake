class OrdersController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def confirm
  end

  def thanks
  end

  def index
  end
  def order_params
    params.require(:ship).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
end
