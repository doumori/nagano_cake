class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @order_new = Order.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.where(item_id: @cart_item.item_id).exists?
      # 個数を合算する
      @cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      # （カラムを指定　現在のアイテムの量　＋　送られてきたパラメータの値）
      @cart_item.update(item_quantity: @cart_item.item_quantity + params[:cart_item][:item_quantity].to_i)
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    CartItem.find(params[:id]).update(cart_item_params)
    redirect_to request.referer
  end

  def destroy_all
    @cart_item_destroy_all = current_customer.cart_items.all
    if @cart_item_destroy_all.destroy_all
      redirect_to items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_quantity)
  end
end