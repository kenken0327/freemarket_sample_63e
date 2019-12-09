class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:index,:show,:edit,:update]

  def index
    @items = Item.where(saler: current_user.id)
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.update_attributes(user_params)
    redirect_to action: :show
    else
    refirect_to action: :edit
    end
  end
  
private

  def user_params
    params.require(:user).permit(:nickname,:self_info)
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
