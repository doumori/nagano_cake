class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item=OrderItem.find(params[:id])
    @order_item.update(order_item_params)

    @order_item.order.order_items.each_with_index do |o_i, index|
      p "製作完了"
      p index
      p o_i.product_status
    unless o_i.product_status=="製作完了"
      p "まだ製作中の製品あり"
      break
       end
       #o_iが一週なら
       if index == @order_item.order.order_items.size - 1
        @order_item.order.update(status: "発送準備中")
      end
    end
    redirect_to admins_order_path(@order_item.order.id)
  end

  private
    def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :product_status,:price,:quantity,:name)
  end
end
