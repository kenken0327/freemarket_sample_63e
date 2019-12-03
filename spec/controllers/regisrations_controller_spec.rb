require 'rails_helper'

describe RegisrationsController do
  describe 'GET #signup' do
  it "renders the :signup template" do
    get :signup
    expect(response).to render_template :signup
  end
end

  describe 'GET #phone' do
  it  "renders the :phone template" do
    get :phone
    expect(response).to render_template :phone
    end
  end

  describe 'GET #address' do
  it "renders the :address template" do
    get :address
    expect(response).to render_template :address
    end
  end
end
