class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :set_user, only: [:index,:show]
  before_action :set_category, only:[:new,:create,:edit,:update]

  def index
    @items = Item.where.not(saler: current_user.id)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render action: :new
    end
  end

  def show

  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to users_path
  end

  def destroy
    @item.destroy
    redirect_to users_path
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :ship_way, :ship_price,
      :description, :ship_date, :condition, :category_id, :ship_place, :saler).merge(user_id: current_user.id)
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
