class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!


  def index
  	@customers = Customer.page(params[:page]).per(10).order('updated_at DESC') 
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to admins_customers_path
  end


  private
  def customer_params
  	params.require(:customer).permit(:last_name, :first_name, :email, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :is_member_status)
  end


end
