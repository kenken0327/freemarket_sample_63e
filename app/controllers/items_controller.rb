class ItemsController < ApplicationController
 before_action :authenticate_user!

  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @item.users << current_user
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to :root
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :ship_way, :ship_price, :ship_date, :condition, :user_ids[])
  end
end
