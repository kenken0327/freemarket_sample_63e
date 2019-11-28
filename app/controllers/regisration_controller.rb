class RegisrationController < ApplicationController

  def index
    
  end

  def show
    @user = User.find(current_user.id)
  end

  def signup
    @user = User.new # 新規インスタンス作成
  end

  def signup_validates  #signup1で入力された情報のバリデーションチャックをするためのアクション
    # createアクションにデータを渡すためにsessionに代入
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

    # バリデーションチャックするためにインスタンスを作成
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_kana: session[:last_kana],
      first_kana: session[:first_kana],
      year_id: session[:year_id],
      month_id: session[:month_id],
      date_id: session[:date_id]
    )
    #バリデーションチャック
    @user.valid?  #無効な値の場合はfalseとインスタンスに対してエラーメッセージを追加してくれる

    #今回はstep1でphonenumberを入力しないので設定しているpresence: trueに引っかかっている
    #このメソッドでphonenumberのエラー内容を削除してバリデーションを通過させる。
    skip_phonenumber_validate(@user.errors) 

    if @user.errors.messages.blank? && @user.errors.details.blank?
      redirect_to phone_regisration_index_path  #step1で入力したデータにバリデーションエラーがない場合はstep2に遷移する
    else
      render :signup
    end
  end


  def phone
    @user = User.new # 新規インスタンス作成
  end

  def phone_validates
    session[:tell_no] = phone_params[:tell_no]

    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name:session[:first_name],
      last_kana:session[:last_kana],
      first_kana:session[:first_kana],
      year_id:session[:year_id],
      month_id: session[:month_id], 
      date_id: session[:date_id],
      tell_no: session[:tell_no],)

    @user.valid? 
    skip_basicinfo_validate(@user.errors) 

    if @user.errors.messages.blank? && @user.errors.details.blank?
       session[:id] = @user.id
      redirect_to  regisration_index_path
    end
  end
  

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name:session[:first_name],
      last_kana:session[:last_kana],
      first_kana:session[:first_kana],
      year_id:session[:year_id],
      month_id: session[:month_id], 
      date_id: session[:date_id],
      tell_no: user_params[:tell_no], 
    )
    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
      session.delete(:nickname)
      session.delete(:email)
      session.delete(:password)
      session.delete(:last_name)
      session.delete(:first_name)
      session.delete(:last_kana)
      session.delete(:first_kana)
      session.delete(:tell_no)
      session.delete(:year_id)
      session.delete(:month_id)
      session.delete(:day_id)
      redirect_to  address_regisration_index_path
    end
  end

  def address
    @address = Address.new
  end

  def address_create
    @address = Address.new(address_params)
    if @address.save
      redirect_to create_finish_regisration_index_path
    end
  end

  def create_finish
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
      :tell_no)
  end

  def address_params
    params.require(:address).permit(:prefecture_id,:post_no,:city,:town,:building,:tell).merge(user_id: current_user.id)
  end

  def skip_phonenumber_validate(errors)
    errors.messages.delete(:tell_no)  #stepの回数や入力するデータに合わせて変更してください
    errors.details.delete(:tell_no)
  end

  def skip_basicinfo_validate(errors) 
    errors.messages.delete(:nickname) 
    errors.messages.delete(:email)
    errors.messages.delete(:password) #stepの回数や入力するデータに合わせて変更してください
    errors.messages.delete(:last_name)
    errors.messages.delete(:first_name)
    errors.messages.delete(:last_kana)
    errors.messages.delete(:first_kana)
    errors.messages.delete(:year_id)
    errors.messages.delete(:month_id)
    errors.messages.delete(:date_id)
    errors.details.delete(:first_name)
    errors.details.delete(:nickname) 
    errors.details.delete(:email)
    errors.details.delete(:password) #stepの回数や入力するデータに合わせて変更してください
    errors.details.delete(:last_name)
    errors.details.delete(:first_name)
    errors.details.delete(:last_kana)
    errors.details.delete(:first_kana)
    errors.details.delete(:year_id)
    errors.details.delete(:month_id)
    errors.details.delete(:date_id)

  end
end
