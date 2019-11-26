class AddressController < ApplicationController

def new
  @address= Address.new
end

def create
  @address = Address.new(address_params)
  @address.save
  redirect_to regisration_index_path
end

private
  def address_params
    params.require(:address).permit(
      :prefecture_id,
      :post_no,
      :city,
      :town,
      :building,
      :tell,
    ).merge(user_id: current_user)
  end

end
