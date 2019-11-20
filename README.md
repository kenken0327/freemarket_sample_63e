# items_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key:true|
|custmer_id|references|

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
|post_no|string|null: false|
|tell_no|string|null: false|
|card_id|integer|
|image|string|


### Association
- has_many :items,through: :items_users
- has_many :items_users


# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: ture|
|user_id|string|null: false|
|image|string|null: false|
|category_id|integer|null: false|
|ship_way||string|null: false|
|ship_price|string|null: false|
|ship_date|string|null :false|
|place_id|integer|null :false|
|condition|string|null :false|
|bland-id|string|null :false|


### Associtaion
- has_many :users,through: :items_users
- has_many :items_users
- belongs_to :category
- belongs_to :bland
- belongs_to :place

# cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
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

### placeテーブル

|Cokumn|Type|Options|
|------|----|-------|
|place|string|

- has_many: items

### 


