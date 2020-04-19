class ShipsController < ApplicationController
  # カレントユーザーだけしかedit,update,destroyアクションは使えない。
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  # ※カレントユーザー以外は直接リンクを入力しても編集ページにいけないようにする
  def ensure_correct_user
    @ship = Ship.find(params[:id])
    # ※カレントユーザーIDがbook.user_idと同じでない場合はbooks_pathへ飛ばす
    if current_customer.id != @ship.customer_id
      flash[:notice] = "ページにアクセスする権限がありません"
      redirect_to(root_path)
    end
  end

  def index
    @ships = Ship.all
    @ship = Ship.new
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def destroy
    ship = Ship.find(params[:id])
    ship.destroy
    redirect_to ships_path
  end

  def update
    @ship = Ship.find(params[:id])
     if @ship.update(ship_params)
      redirect_to ships_path
    else
      render :edit
    end
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.customer_id = current_customer.id
    if @ship.save
      redirect_to ships_path
    else
      @ships = Ship.all
      render :index
    end
  end


  private
  def ship_params
    params.require(:ship).permit(:customer_id, :address, :name, :code)
  end
end
