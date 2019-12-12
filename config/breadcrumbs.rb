crumb :items do
  link "Fマーケット", items_path
end

crumb :user_show do
  link "マイページ", user_path
  parent :items
end

crumb :user_edit do
  link "プロフィール", edit_user_path
  parent :user_show
end

crumb :items_show do
  link "ジャケット", item_path
  parent :items
end