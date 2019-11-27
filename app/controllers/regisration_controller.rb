class RegisrationController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end


  def signup
    @user = User.new # 新規インスタンス作成
  end

  def phone
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_kana] = user_params[:last_kana]
    session[:first_kana] = user_params[:first_kana]
    session[:year_id] = user_params[:year_id]
    session[:month_id] = user_params[:month_id]
    session[:date_id] = user_params[:date_id]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    session[:tell_no] = user_params[:tell_no]
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name:session[:first_name],
      last_kana:session[:last_kana],
      first_kana:session[:last_kana],
      year_id:session[:year_id],
      month_id: session[:month_id], 
      date_id: session[:date_id],
      tell_no: session[:tell_no], 
    )
    @user.build_address(user_params[:address_attributes])
    if @user.save
      session[:id] = @user.id
      redirect_to  done_regisration_index_path
    else
      redirect_to  root_path
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    @user = User.find(session[:id])
    redirect_to regisration_path(@user)
  end
  
  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :last_name, 
      :first_name, 
      :last_kana, 
      :first_kana, 
      :year_id,
      :month_id,
      :date_id,
      :tell_no,address_attributes: 
    [:id,:prefecture_id,:post_no,:city,:town,:building,:tell]
  )

  end
end
