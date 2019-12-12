require 'rails_helper'
describe Item do
  describe '#create' do

    it "is invalid without a image" do
      item = build(:item, image:"")
      item.valid?
      expect(item.errors[:image]).to include("画像がありません")
    end

    it "is invalid without a name" do
      item = build(:item, name:"")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a condition" do
      item = build(:item, condition:"")
      item.valid?
      expect(item.errors[:condition]).to include("選択してください")
    end

    it "is invalid without a ship_price" do
      item = build(:item, ship_price:"")
      item.valid?
      expect(item.errors[:ship_price]).to include("選択してください")
    end

    it "is invalid without a ship_way" do
      item = build(:item, ship_way:"")
      item.valid?
      expect(item.errors[:ship_way]).to include("選択してください")
    end

    it "is invalid without a ship_date" do
      item = build(:item, ship_date:"")
      item.valid?
      expect(item.errors[:ship_date]).to include("選択してください")
    end

    it "is invalid without a price" do
      item = build(:item, price:"")
      item.valid?
      expect(item.errors[:price]).to include("300以上9999999以下で入力してください")
    end

    it "is invalid without a saler" do
      item = build(:item, saler:"")
      item.valid?
      expect(item.errors[:saler]).to include("を入力してください")
    end
  end
end