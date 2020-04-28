class ItemsController < ApplicationController
  def index

     @items_all = Item.all
    @order_confirm = Order.new
    @genres=Genre.all
        if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8).order('updated_at DESC')
    else
      @items = Item.page(params[:page]).per(8).order('updated_at DESC') 
    end
      @rank_items = OrderItem.find(OrderItem.group(:item_id).order('count(quantity) desc').limit(3).pluck(:id))
  end
  def self.search(search)
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Project.where(['name LIKE ?', "%#{search}%"])
    else
      Project.all #全て表示。
    end
  end
  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
    @genres=Genre.all
  end
  def top
    @rank_items = OrderItem.find(OrderItem.group(:item_id).order('count(quantity) desc').limit(3).pluck(:id))
    @push_items = Item.last(2)
  end
  private
  def item_params
    params.require(:item).permit(:genre_id, :description, :name, :price, :image_id, :is_sale_status)
  end
end
