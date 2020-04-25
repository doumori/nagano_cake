class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item=OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    # each_with_indexで番号を振ってeachする。indexが回す回数
    @order_item.order.order_items.each_with_index do |o_i, index|
      # order.order_itemが全て製作完了でなければ条件を終了する
    unless o_i.product_status=="製作完了"
      break
       end
       # ”製作完了”であれば、回数を1回減らしてupdateする
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
