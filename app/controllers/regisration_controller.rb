class RegisrationController < ApplicationController

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:name] = user_params[:name]
    session[:kana] = user_params[:kana]
    session[:birthday] = user_params[:birthday]

    @user = User.new # 新規インスタンス作成
  end

  def step3
    session[:tell_no] = user_params[:tell_no]
    @user = User.new
  end


  def step4
    @address= Address.new
  end

  def step5
    @address= Address.new(address_params)
    redirect_to 
  end

  def create
    binding.pry
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      name: session[:name], 
      kana: session[:kana],
      birthday: session[:birthday], 
      tell_no: session[:tell_no], 
    )
    if @user.save
      session[:id] = @user.id
      redirect_to  edit_regisration_path(@user)
    else
      redirect_to  root_path
    end
  end
  
  def show
  end


  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :name, 
      :kana, 
      :birthday, 
      :tell_no,
      :id,)
  end

  def address_params
    params.require(:address).permit(
      :post_no,
      :prefecture_id,
      :town,
      :city,
      :building,
      :tell,
    ).merge(user_id: current_user_id)
end

end
