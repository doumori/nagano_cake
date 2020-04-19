class Admins::AdminsController < ApplicationController
  def top
    @orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end

