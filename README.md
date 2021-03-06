# DB設計

宿泊のみ
余裕があれば⇨体験、レストランを追加

# ユーザー管理

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|(not update)
|last_name|string|null: false|(not update)
|birthday_month|integer|null: false|(not update)
|birthday_day|integer|null: false|(not update)
|birthday_year|integer|null: false|(not update)
|email|string|null: false, unique: true|
|gender|integer||
|native_currency|string||
|preferred_locale|string||
|tel_number|integer||

### Association
- has_many :reviews
- has_many :favorites
- has_many :rooms, through: :favorites
- belongs_to :language
- belongs_to :currency
- has_many :rooms, through: :hosts
- has_many :hosts
- has_many :messges
- has_one :profile, foreign_key: 'id'


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|introduction|text||
|address|text||
|school|text||
|company|text||

### Association
- belongs_to :user, foreign_key: 'id'


<!-- ## languagesテーブル

|Column|Type|Options|
|------|----|-------|
|country|string|null: false, unique: true|

### Association
- has_many :users -->


## currenciesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_one :user
- has_one :room


## hostsテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|references| null: false|
|room_id|references| null: false|

### Association
- belongs_to :user
- belongs_to :room

***

# rooms関連のテーブル

## roomsテーブル

|Column|Type|Options|
|------|----|-------|
|room_category_id|references|null: false|
|building_type_id|references|null: false|
|bathroom_id|references|null: false|
|deadline_id|references|null: false|
|currency_id|references|null: false|
|room_type|integer|null: false|
|person_capacity|integer|null: false|
|address|text|null: false|
|only_for_guest|boolean|null: false|
|bedroom_number|integer|null: false|
|bed_number|integer|null: false|
|check_in_from|string|null: false|
|check_in_to|string|null: false|
|min_lodging|integer|null: false|
|max_lodging|integer|null: false|
|day_fee|integer|null: false|
|experience|ingeger||/経験
|frequency|integer||/頻度
|child_permission|boolean| default: false|
|child_not_reason|text||
|infant_permission|boolean| default: false|
|infant_not_reason|text||
|pet_permission|boolean| default: false|
|smoking_permission|boolean| default: false|
|party_permission|boolean| default: false|

### Association
- has_many :users , through: :favorites
- has_many :favarites
- has_many :users , through: :hosts
- has_many :hosts
- has_many :room_shared_spaces , through: :room_shared_spaces
- has_many :room_shared_spaces
- has_many :amenities , through: :room_amenities
- has_many :room_amenities
- has_many :available_spaces , through: :room_available_spaces
- has_many :room_available_spaces
- has_many :requirements , through: :room_requirements
- has_many :room_requirements
- has_many :notices , through: :room_notices
- has_many :room_notices
- has_many :messages , through: :user_messages
- has_many :user_messages
- has_many :favarites
- has_many :images
- has_many :calenders
- belongs_to :room_category
- belongs_to :building_type
- belongs_to :bathroom
- belongs_to :deadline
- belongs_to :currency

# roomsと一対多のテーブル

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :rooms

## building_typesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :rooms

## bathroomsテーブル

|Column|Type|Options|
|------|----|-------|
|number|integer|null:false|
|only_for_guest|boolean||

### Association
- has_many :rooms

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|room_id|references|null: false|

### Association
- belongs_to :room


## deadlinesテーブル

|Column|Type|Options|
|------|----|-------|
|date|date|null: false|

### Association
- has_many :rooms

## calendarsテーブル

|Column|Type|Options|
|------|----|-------|
|date|date|null: false|
|room_id|references|null: false|

### Association
- belongs_to :room

# roomsと多対多のテーブル

## shared_spaces

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :room_shared_spaces
- has_many :room_shared_spaces


## amenitiesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :room_amenities
- has_many :room_amenities

## available_spacesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|


### Association
- has_many :rooms, through: :room_available_spaces
- has_many :room_available_spaces


## requirementsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :room_requirements
- has_many :room_requirements


## noticesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :room_notices
- has_many :room_notices


# 中間テーブル

## room_shared_spacesテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|shared_space_id|references|null: false|

### Association
- belongs_to :room
- belongs_to :shared_space

## room_amenitiesテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|amenitie_id|references|null: false|

### Association
- belongs_to :room
- belongs_to :amenity

## room_available_spacesテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|available_space_id|references|null: false|

### Association
- belongs_to :room
- belongs_to :available_space

## room_requirementsテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|references|null: false|
|requirement_id|references|null: false|

### Association
- belongs_to :room
- belongs_to :requirement

## room_noticesテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|notice_id|references|null: false|

### Association
- belongs_to :rooms
- belongs_to :notices

***

# 予約

## room_appointmentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|room_id|references|null: false|
|check_in_date|date|null: false|
|check_out_date|date|null: false|
|number_of_adult|integer|null: false|
|number_of_child|integer||
|number_of_infant|integer||
|message|text|null: false||
|cleaning_fee|integer||
|service_fee|integer||
|total_fee|integer|null: false|
|kind|integer|null: false|

### Association
- belongs_to :user
- belongs_to :room

***

# メッセージ関連

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string||
|body|text|null: false|
|kind|integer|null: false|

### Association
- has_many :users , through: :user_messages
- has_many :users_messages


## user_messagesテーブル

|Column|Type|Options|
|------|----|-------|
|send_user_id|references|null: false|
|receive_user_id|references|null: false|
|message_id|references|null: false|

### Association
- belongs_to :message
- belongs_to :user

***

# レビュー

## room_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|accuracy_rate|integer|null: false|
|communication_rate|integer|null: false|
|cleanliness_rate|integer|null: false|
|location_rate|integer|null: false|
|check_in_rate|integer|null: false|
|cost_performance_rate|integer|null: false|
|user_id|references|null: false|
|room_id|references|null: false|

### Association
- belongs_to :user
- belongs_to :room

***

# お気に入り

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|room_id|references|null: false|

### Association
- belongs_to :user
- belongs_to :room
- belongs_to :favorite_folder

## favorite_foldersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :favorites

***

<!--
# 保留（体験）

## experiencesテーブル

|Column|Type|Options|
|------|----|-------|

### Association


## experience_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|rate|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|experience_id|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :experience

## experience_reservationsテーブル

|Column|Type|Options|
|------|----|-------|

 -->
