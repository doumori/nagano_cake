class Customers::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

    private
  def customer_params
    params.require(:cart_item).permit(:last_name, :first_name, :last_name_kana,:first_name_kana,:post_code,:address,:phone_number,:is_member_status)
  end
end
