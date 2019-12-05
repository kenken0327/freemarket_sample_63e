# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false|
|password|string|null: false|
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

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: ture|
|user_id|references|null: false,foreign_key: true|
|image|string|null: false|
|price|integer|null: false|
|category_id|integer|null: false,foreign_key: true|
|ship_place|string|null: false|
|ship_way|string|null: false|
|ship_price|string|null: false|
|ship_date|string|null :false|
|condition|string|null :false|

### Associtaion
- belongs_to :user
- belongs_to :category

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
|ancestory|string|null: false|
|name|string|null: false|

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
- 都道府県は更新がない静的なモデルのため
  prefecturemモデルにハッシュ型でidと都道府県を
  格納しようと考えています。

### Asscociation
- has_many_active_hash :address






