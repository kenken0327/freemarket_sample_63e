class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new 
    card = Card.where(user_id: current_user.id).first
    if card.present?
      redirect_to create_finish_regisration_index_path 
    end
  end


  def create 
    Payjp.api_key = 'sk_test_7fd03f8392a97edcc9f995db'
    if params['payjp-token'].blank?
      redirect_to items_path
    else
      
      customer = Payjp::Customer.create(
        description: 'test'
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to create_finish_regisration_index_path
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

end
