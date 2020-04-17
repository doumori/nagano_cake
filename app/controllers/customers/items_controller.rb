class Customers::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def top
    @push_items = Item.last(5)
  end

  def tax
    @tax = * 1.1
  end

  private
  def customer_params
    params.require(:cart_item).permit(:genre_id, :description, :name, :price, :image_id, :is_sale_status)
  end
end
