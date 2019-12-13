require 'rails_helper'

describe RegisrationsController do
  
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
    
  describe 'POST #create' do
  binding.pry
  let(:params) {{ user: attributes_for(:user) }}

  subject {
    post :create,
    params: params
  }
  it "新しいユーザーが登録されるか" do
    expect{ subject }.to change(User,:count).by(1)
    end
  end
end

