class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :set_user, only: [:index,:show]
  before_action :set_category, only:[:edit,:update]

  def index
    @items = Item.where.not(saler: current_user.id)
  end
  
  def new
    @item = Item.new
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
      end
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save!
      redirect_to items_path
    else
      render action: :new
    end
  end

  def show

  end

  def edit
    if current_user.id != @item.user_id
      render action: :show
    end
  end

  def update
    @item.update(item_params)
    if @item.update_attributes(item_params)
    redirect_to users_path
    else
    render action: :edit
    end
  end


  def destroy
    if current_user.id != @item.user_id
      render action: :show
    end
    @item.destroy
    redirect_to users_path
  end

     # 以下全て、formatはjsonのみ
   # 親カテゴリーが選択された後に動くアクション
  def get_category_children  
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :ship_way, :ship_price,
      :description, :ship_date, :condition, :category_id, :ship_place, :saler).merge(user_id: current_user.id, category_id: Category.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_category
    @parents = Category.all.order("id ASC").limit(13)
  end
end
