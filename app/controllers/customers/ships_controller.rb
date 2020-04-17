class Customers::ShipsController < ApplicationController
  def index
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
  end
  private
  def ship_params
    params.require(:ship).permit(:customer_id, :address, :name, :code)
  end
end
