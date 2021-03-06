class ApplicationController < ActionController::Base
	# before_actionはすべてのコントローラ実行する際に最初に行われる
	# デバイスのコントローラー用
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

	# ログイン後にマイページに飛ぶ
	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admins_path
	  when Customer
	    root_path
	  end
	end

	def after_sign_out_path_for(resource)
	  case resource
	  when :admin
	    new_admin_session_path
	  when :customer
	    root_path
	  end
	end

 	# サインアップ時に保存するカラムを追加する
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name,:last_name_kana,:first_name_kana, :post_code, :address, :phone_number, :is_member_status])
	end
	# データ更新時のパラメーターを設定する
	def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :last_name, :first_name,:last_name_kana,:first_name_kana, :post_code, :address, :phone_number, :is_member_status ])
  end
def set_search
  #@search = Article.search(params[:q])
  @search = Item.ransack(params[:q]) #ransackメソッド推奨
  @search_items = @search.result.page(params[:page]).per(10)
end
end
