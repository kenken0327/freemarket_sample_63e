class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to action: :show
  end

private

  def user_params
    params.require(:user).permit(:nickname,:self_info)
  end

end
