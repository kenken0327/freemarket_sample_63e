require 'rails_helper'
describe Address do
  describe '#create' do

  it "郵便番号を入力してください" do
    address = build(:address, post_no:"")
    address.valid?
    expect(address.errors[:post_no]).to include("を入力してください")
    end

  it "都道府県を選択してください" do
    address = build(:address,prefecture_id:"")
    address.valid?
    expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

  it "市区町村を入力してください" do
    address = build(:address,city:"")
    address.valid?
    expect(address.errors[:city]).to include("を入力してください")
    end

  it "番地以下を入力してください" do
    address = build(:address,town:"")
    address.valid?
    expect(address.errors[:town]).to include("を入力してください")
    end
  end
end