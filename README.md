# transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|buy|string|default: :1|

### Association
- belongs_to :item
- belongs_to :user


# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: ture|
|e-mail|string|null: false|
|password|string|null: false|
|name|string|null: false|
|kana|string|null: false|
|birthday|datetime|null: false|
|self_introduction|text|
|tell_no|integer|null: false|
|card_id|integer|foreign_key: true|
|address_id|integer|foreign_key: true|
|image|string|


### Association
- has_many :items,through: :transaction
- has_many :transaction
- has_one :card
- has_one :address


# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: ture|
|user_id|string|null: false|
|image|text|null: false|
|price|integer|null: false|
|category_id|integer|null: false,foreign_key: true|
|place_id|integer|null :false,foreign_key: true|
|bland-id|string|null :false,foreign_key: true|
|ship_way|string|null: false|
|ship_price|string|null: false|
|ship_date|string|null :false|
|condition|string|null :false|


### Associtaion
- has_many :users,through: :transaction
- has_many :transaction
- belongs_to :category
- belongs_to :bland
- belongs_to :place

# cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|
|card_info|string|

### Association
- belongs_to :user

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|
|ancestory|string|

### Association
- has_many: items

# blandsテーブル

|Column|Type|Options|
|------|----|-------|
|bland|string|

### Associtaion
- has_many: items

# addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foregin_key: true|
|prefecture_id|integer|null: false|
|post_no|integer|null: false|
|city|string|null: false|
|town|string|null: false|
|building|string|
|tell|integer|

### Association
- belongs_to_active_hash :prefecture
- belongs_to :user

# prefecturesテーブル
- 都道府県は更新がない静的なモデルのため
- prefecturemモデルにハッシュ型でidと都道府県を
- 格納しようと考えています。

### Asscociation
- has_many_active_hash :address






