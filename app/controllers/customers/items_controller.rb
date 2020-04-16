class Customers::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def top
  end
  private
  def customer_params
    params.require(:cart_item).permit(:genre_id, :description, :name,:price,:image_id,:is_sale_status)
  end
end
