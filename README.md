# transactionテーブル

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
|post_no|integer|null: false|
|tell_no|integer|null: false|
|card_id|integer|foreign_key: true|
|image|string|


### Association
- has_many :items,through: :items_users
- has_many :items_users
- has-one :card


# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: ture|
|user_id|string|null: false|
|image|string|null: false|
|price|integer|null: false|
|category_id|integer|null: false,foreign_key: true|
|place_id|integer|null :false,foreign_key: true|
|bland-id|string|null :false,foreign_key: true|
|ship_way||string|null: false|
|ship_price|string|null: false|
|ship_date|string|null :false|
|condition|string|null :false|



### Associtaion
- has_many :users,through: :items_users
- has_many :items_users
- belongs_to :category
- belongs_to :bland
- belongs_to :place

# cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|
|card_info|string|

### Association
- belongs_to :user

# categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|

### Association
- has_many: items

# blandテーブル

|Column|Type|Options|
|------|----|-------|
|bland|string|

### Associtaion
- has_many: items

# placeテーブル

|Cokumn|Type|Options|
|------|----|-------|
|place|string|

### Association
- has_many: items




