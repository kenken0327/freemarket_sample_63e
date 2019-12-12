FactoryBot.define do

  factory :item do
    image               {Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/adbg.jpg"))}
    name                {"商品名"}
    condition           {"未使用に近い"}
    ship_price          {"送料込み(出品者負担)"}
    ship_way            {"未定"}
    ship_date           {"1~2日で発送"}
    price               {"301"}
    saler               {"1"}
    description         {"アイウエオ"}
    prefecture_id       {"1"}
    buyer               {""}
    category
    user
  end

end