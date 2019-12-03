class ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.users << current_user
    if @item.save!
      redirect_to items_path
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, {images:[]}, :price, :ship_way, :ship_price, :ship_date, :condition,saler: current_user.id)
  end
end
