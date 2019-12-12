crumb :items do
  link "Fマーケット", items_path
end

crumb :user_show do
  link "マイページ", user_path(current_user)
  parent :items
end

crumb :user_edit do
  link "プロフィール", edit_user_path
  parent :user_show
end

crumb :user_show_index do
  link "出品した商品-出品中", users_path
  parent :user_show
end

crumb :user_show_buy do
  link "出品した商品-購入済", show_buy_users_path
  parent :user_show
end


crumb :items_show do |item|
  link item.name, item_path
  parent :items
end