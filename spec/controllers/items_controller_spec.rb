require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  describe 'GET #index' do
    context 'log in' do
      before do
        login_user user
      end

      it "populates an array of items" do
        items = create_list(:item, 3)
        get :index
        expect(assigns(:items)).to match(items)
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      it "redirect_to session" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'log in' do
      before do
        login_user user
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      it "redirect_to session" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:params) { { item: attributes_for(:item, user_id: user.id, category_id: category.id) } }
    let(:invalid_params) { { item: attributes_for(:item, image: nil, user_id: user.id) } }

    context 'log in' do
      before do
        login_user user
      end
      
      context 'can save' do

        subject{
          post :create,
          params: params
        }

        it " count up item " do
          expect{ subject }.to change(Item, :count).by(1)
        end

        it "redirects to items_path" do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context 'can not save' do

        subject {
          post :create,
          params: invalid_params
        }

        it "does not count up" do
          expect{ subject }.not_to change(Item, :count)
        end

        it "renders index" do
          subject
          expect(response).to render_template :new
        end
      end
    end

    context 'not log in' do
      it "redirects to new_user_session_path" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'log in' do
      before do
        login_user user
      end

      it "populates an item" do
        item = create(:item)
        get :show, params: { id: item }
        expect(assigns(:item)).to eq (item)
      end

      it "renders the :show template" do
        item = create(:item)
        get :show, params: { id: item }
        expect(response).to render_template :show
      end
    end

    context 'not log in' do
      it "redirect_to session" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end