class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:show,:edit,:update,:destroy,:add_buy_id]
  before_action :set_user, only: [:index,:show,:search]
  before_action :set_category, only:[:new,:create,:edit,:update]

  def index
    @items = Item.where.not(saler: current_user.id).where(buyer: nil)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
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

  def add_buy_id
    @item.update_column(:buyer,current_user.id)
    if @item.update_column(:buyer,current_user.id)
      redirect_to root_path
    else
      redirect_to done_card_path
    end
  end

  def search
    @items = Item.search(params[:keyword]).where.not(saler:current_user.id)
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :ship_way, :ship_price,
      :description, :ship_date, :condition, :category_id, :prefecture_id, :saler, :buyer).merge(user_id: current_user.id)

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
