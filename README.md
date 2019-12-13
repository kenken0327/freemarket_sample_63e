# usersテーブル
|Column|Type|Options|
|------|----|-------|
|e-mail|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|first_name|string|null: false|
|last_kana|string|null: false|
|first_kana|datetime|null: false|
|last_kanaroduction|text|
|year_id|integer|null: false|
|month_id|integer|null: false|
|date_id|integer|null: false|
|tell_no|string|null: false|
|image|string|
|self_info|text|


### Association
- has_many :items
- has_one :card
- has_one :address
- belongs_to_active_hash :year
- belongs_to_active_hash :month
- belongs_to_active_hash :day

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|category_id|integer|null: false,foreign_key: true|
|name|string|null: false,index: ture|
|image|text|null: false|
|description|text|null: false|
|price|integer|null: false|
|prefecture_id|integer|null: false|
|ship_way|integer|null: false|
|ship_price|integer|null: false|
|ship_date|integer|null :false|
|condition|integer|null :false|
|saler|integer|null :false|
|buyer|integer|

### Associtaion
- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :prefecture

# cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|ancestory|string|
|name|string|

### Association
- has_many: items

# addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foregin_key: true|
|prefecture_id|integer|null: false|
|post_no|string|null: false|
|city|string|null: false|
|town|string|null: false|
|building|string|
|tell|integer|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


# prefecturesテーブル
# yearsテーブル
# monthsテーブル
# datesテーブル
- 都道府県や、生年月日の年月日などは更新がない静的なモデルのため
  active_hashというgemを用いてにハッシュ型でidとそれぞれの
  値を格納致しました。










