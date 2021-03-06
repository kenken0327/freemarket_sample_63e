class RegisrationsController < ApplicationController

  def index
    
  end

  def show
    @user = User.find(current_user.id)
  end


  def signup
    @user = User.new 
  end

  def signup_validates
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
   
    @user.valid? 
    skip_phonenumber_validate(@user.errors) 

    if @user.errors.messages.blank? && @user.errors.details.blank?
      redirect_to phone_regisrations_path  
    else
      render :signup
    end
  end


  def phone
    @user = User.new
  end
  
  def create
    @user = User.new(
      nickname: session[:nickname], 
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
    if @user.errors.messages.blank? && @user.errors.details.blank?
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
        session.delete(:date_id)
        redirect_to  address_regisrations_path
        else
        render :phone
        end
    else
    render :phone
    end
  end

  def address
    @address = Address.new
  end

  def address_create
    @address = Address.new(address_params)
    @address.valid? 
    if @address.errors.messages.blank? && @address.errors.details.blank?
        if @address.save
        redirect_to new_card_path
        else 
        render :address
        end
    else
      render :address
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
    errors.messages.delete(:tell_no)  
    errors.details.delete(:tell_no)
  end

end
