class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order_new = Order.new
    @ship = Ship.where(customer_id: current_customer.id)
    @my_cart = current_customer.cart_items
    if @my_cart.empty?
        redirect_to request.referer
      end
  end

  def create
    @order_new = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    # カートへ戻る
      if params[:back].present?
            render 'cart_items/index'
        return
    # 情報入力へ戻る
      elsif params[:info].present?
              @ship = Ship.where(customer_id: current_customer.id)
            render 'orders/new'
        return
      end
      if  @order_new.save
        @cart_items.each do |f|
          @order_item_new = OrderItem.new
            @order_item_new.order_id = @order_new.id
            @order_item_new.item_id = f.item.id
            @order_item_new.product_status = "製作待ち"
            @order_item_new.price = f.item.price
            @order_item_new.quantity = f.item_quantity
            @order_item_new.name = f.item.name
          @order_item_new.save
        end
          @ship_new = Ship.new(customer_id: current_customer.id, code: params[:order][:ship_postcode],address: params[:order][:ship_address],name: params[:order][:ship_name])
          @ship_new.save!
        current_customer.cart_items.destroy_all
        redirect_to orders_thanks_path
      else
        redirect_to new_order_path
      end
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def confirm
    @freight = 800
    @cart_items = current_customer.cart_items.all
    @order_new = Order.new(order_params)
    @order_new.customer_id = current_customer.id
    @pay_method = params[:order][:pay_method]
      # 自分の配送先
      if params[:ship_num] == "1"
        @order_postcode = current_customer.post_code
        @order_address = current_customer.address
        @order_name = (current_customer.last_name) + (current_customer.first_name)
      # 登録済みの配送先
      elsif params[:ship_num] == "2"
        @order_postcode = Ship.find(params[:ship_id]).view_ship_code
        @order_address = Ship.find(params[:ship_id]).view_ship_address
        @order_name = Ship.find(params[:ship_id]).view_ship_name
      # 新しい配送先
      else
        @order_postcode = params[:order][:ship_postcode]
        @order_address = params[:order][:ship_address]
        @order_name = params[:order][:ship_name]
        render 'orders/new' if @order_new.invalid?
      end
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  private
  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :product_status, :price, :quantity, :name)
  end

  def order_params
    params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
end
