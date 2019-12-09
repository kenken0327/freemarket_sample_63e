class CardsController < ApplicationController
  require "payjp"
  before_action :set_card



  def check
    @item = Item.find(params[:id])
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => item.price,
      :customer => @card.customer_id,
      :currency => 'jpy',)
    redirect_to done_card_path
  end

  def done
    @item = Item.find(params[:id])
  end

  def new
    gon.new_key ="pk_test_5cf244f8de9e4a97c3dbf614"
    card = Card.where(user_id: current_user.id).first
    if card.present?
      redirect_to create_finish_regisration_index_path 
    end
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to items_path
    else
     
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'], 
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to create_finish_regisrations_path
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
