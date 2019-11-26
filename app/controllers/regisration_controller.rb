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
    binding.pry
    @address= Address.new(address_params)
    if
    @address.save
    redirect_to action: :index
    else
    redirect_to action: :step4
    end
  end

  def create
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
      redirect_to  done_regisration_index_path
    else
      redirect_to  root_path
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    redirect_to step4_regisration_index_path
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
      :prefecture_id,
      :post_no,
      :city,
      :town,
      :building,
      :tell,
    ).merge(user_id: current_user)
end

end
