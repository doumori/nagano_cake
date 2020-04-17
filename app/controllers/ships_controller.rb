class ShipsController < ApplicationController
  # カレントユーザーだけしかedit,update,destroyアクションは使えない。
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  # ※カレントユーザー以外は直接リンクを入力しても編集ページにいけないようにする
  def ensure_correct_user
    @ship = Ship.find(params[:id])
    # ※カレントユーザーIDがbook.user_idと同じでない場合はbooks_pathへ飛ばす
    if current_user.id != @ship.customers_id
      flash[:notice] = "ページにアクセスする権限がありません"
      redirect_to(root_path)
    end
  end

  def index
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def create
  end


  private
  def ship_params
    params.require(:ship).permit(:customer_id, :address, :name, :code)
  end
end
