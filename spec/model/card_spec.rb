require 'rails_helper'
describe Card do
  describe '#create' do
    it "customer_idが入力されていません" do
      card = build(:card ,user: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
  end
end