class Admins::AdminsController < ApplicationController
  def top
    @order_quantity=Order.where("created_at between '#{Order.today} 0:00:00' and '#{Order.today} 23:59:59'")
end
end

