require 'rails_helper'
describe User do
  describe '#create' do

  it "ニックネームを入力してください" do
    user = build(:user, nickname:"")
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
    end
  it "メールアドレスを入力してください" do
    user = build(:user, email:"")
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
    end
  
  it "名字（漢字）を入力してください" do
    user = build(:user, last_name:"")
    user.valid?
    expect(user.errors[:last_name]).to include("を入力してください") 
    end

  it "名前（漢字）を入力してください" do
    user = build(:user, first_name:"")
    user.valid?
    expect(user.errors[:first_name]).to include("を入力してください") 
    end

  it "名字（カナ）を入力してください" do
    user = build(:user, last_kana:"")
    user.valid?
    expect(user.errors[:last_kana]).to include("を入力してください") 
    end

  it "名前（カナ）を入力してください" do
    user = build(:user, first_kana:"")
    user.valid?
    expect(user.errors[:first_kana]).to include("を入力してください")
  end

  it "生年月日（年）を入力してください" do
    user = build(:user, year_id:"")
    user.valid?
    expect(user.errors[:year_id]).to include("を入力してください")
  end

  it "生年月日（月）を入力してください" do
    user = build(:user, month_id:"")
    user.valid?
    expect(user.errors[:month_id]).to include("を入力してください")
    end
  it "生年月日（日）を入力してください" do
    user = build(:user, date_id:"")
    user.valid?
    expect(user.errors[:date_id]).to include("を入力してください")
    end
  it "電話番号を入力してください" do
    user = build(:user, tell_no:"")
    user.valid?
    expect(user.errors[:tell_no]).to include("を入力してください")
    end
  end
end