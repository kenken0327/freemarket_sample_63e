class ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @item = Item.new(item_params)
    @parents = Category.all.order("id ASC").limit(13)
    if @item.save
      redirect_to items_path
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :ship_way, :ship_price, :description, :ship_date, :condition, :category_id, :ship_place, saler: current_user.id)
  end
end
