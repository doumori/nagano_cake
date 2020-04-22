class OrdersController < ApplicationController

  def new
    @order_new = Order.new
    @by_address = current_customer.address
    @ships = current_customer.ships
    # カートが空の時は注文できない
    @my_cart = current_customer.cart_items
      if @my_cart.empty?
        redirect_to request.referer
      end
  end

  def create
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    # カートへ戻る
      if params[:back].present?
            render 'cart_items/index'
          return
      elsif params[:info].present?
            render 'new'
          return
      end
      if  @order.save
        @cart_items.each do |f|
          @order_item_new = OrderItem.new
            @order_item_new.order_id = @order.id
            @order_item_new.item_id = f.item.id
            @order_item_new.product_status = "製作待ち"
            @order_item_new.price = f.item.price
            @order_item_new.quantity = f.item_quantity
            @order_item_new.name = f.item.name
          @order_item_new.save
        end
        current_customer.cart_items.destroy_all
        redirect_to orders_thanks_path
      else
        render 'customers/new'
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
        @order_address = current_customer.address
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
      end
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  private
  def order_item_params
    params.require(:order).permit(:item_id, :order_id, :product_status, :price, :quantity, :name)
  end

  def order_params
    params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
end