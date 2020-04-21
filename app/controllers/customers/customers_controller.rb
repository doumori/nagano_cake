class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer), notice: "successfully updated customer!"
    else
      render :edit
    end
  end

  def confirm
  end

  def hide
    #is_member_statusカラムにフラグを立てる(defaultはfalse)
    current_customer.update(is_member_status: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,:first_name_kana,:post_code,:address,:phone_number,:is_member_status)
  end
end
