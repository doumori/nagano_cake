class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item=OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
    if @order_item.status = "制作完了"
       @order.status 

      redirect_to admins_order_path(@order_item.order.id)
    else
      redirect_to admins_order_path(@order_item.order.id)
    end
  end

  private
    def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :product_status,:price,:quantity,:name)
  end
end
