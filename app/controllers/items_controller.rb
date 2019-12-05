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
    if @item.save!
      redirect_to items_path
    else
      render action: :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :ship_way, :ship_price, :ship_date, :condition,:saler).merge(user_id: current_user.id)
  end
end
