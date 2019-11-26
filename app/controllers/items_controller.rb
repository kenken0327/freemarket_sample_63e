class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:image).permit(:name, :image, :price, :ship_way, :ship_price, :ship_date, :condition)
  end

end
