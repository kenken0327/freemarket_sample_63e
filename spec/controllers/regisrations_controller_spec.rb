require 'rails_helper'

describe RegisrationsController do
  let(:params) { { user_id:1,nickname:"ジャバ",email:"java@gmail.com",password:"jbwz22",first_name:"伊藤",last_name:"航太",first_kana:"イトウ",last_kana:"コウタ",year_id: 1,month_id: 1,date_id: 1,tell_no:""} }
  describe 'GET #signup' do
  it "新規登録画面が表示されるか" do
    get :signup
    expect(response).to render_template :signup
  end
end

  describe 'GET #phone' do
  it  "電話番号認証画面が表示されるか" do
    get :phone
    expect(response).to render_template :phone
    end
  end

  describe 'GET #address' do
  it "お届け先登録画面が表示されるか" do
    get :address
    expect(response).to render_template :address
    end
  end

  describe 'GET #create_finish' do
  it "登録完了画面が表示されるか" do
    get :create_finish
    expect(response).to render_template :create_finish
    end
  end
  
  describe 'POST #signup_validates' do
  it "電話番号以外がレコードに加わるか" do
    expect{post :signup_validates,
      params: params
  }.to change(User, :count).by(1)
      end
    end
  end


