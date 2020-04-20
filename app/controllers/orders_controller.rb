class OrdersController < ApplicationController
  def new
    @order_new = Order.new
    @by_address = current_customer.address
    @ships = current_customer.ships
  end

  def create
    @order = Order.new(order_params)
    @cart_items = CartItem.where(item_id:current_customer.id)
      if  @order.save
        redirect_to orders_thanks_path
      else
        render 'customers/new'
      end
  end

  def show
  end

  def confirm
    @freight = 800
    @cart_items = current_customer.cart_items.all
    @order_new = Order.new(order_params)
    # 上手くいかない。空の時はバリデーションしたい。
    # return if @order_new.valid?
    # render :new
    @order_new.customer_id = current_customer.id
      # newアクションに渡すお届け先の条件分岐
        # 自分の配送先
      if params[:ship_num] == "1"
        @order_address = current_customer.address
        # 登録済みの配送先
      elsif params[:ship_num] == "2"
        @order_address = Ship.find(params[:ship_id]).view_ship
        # 新しい配送先
      else
        @order_address = params[:order][:ship_postcode]
        @order_address = params[:order][:ship_address]
        @order_address = params[:order][:ship_name]
      end
    @pay_method = params[:order][:pay_method]
  end

  def thanks
  end

  def index
  end

  def order_params
    params.require(:order).permit(:customer_id, :pay_method, :status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
end