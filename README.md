# DB設計

宿泊のみ
余裕があれば⇨体験、レストランを追加

# ユーザー管理

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|(not uproad)
|email|string|null: false, unique: true|(not uproad)
|phone|integer|null: false, unique: true|(not uproad)
|birthday|string|null: false|(not uproad)
|introduction|text||
|address|text||
|school|text||
|company|text||
|language_id|integer| foreign_key: true|
|currency_id|integer| foreign_key: true|

### Association
- has_many :reviews
- has_many :favorites
- has_many :rooms, through: :favorites
- belongs_to :language
- belongs_to :currency
- has_many :rooms, through: :hosts
- has_many :hosts
- has_many :messges

## languagesテーブル

|Column|Type|Options|
|------|----|-------|
|country|string|null: false, unique: true|

### Association
- has_many :users

## currencysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :users
- has_many :rooms


## hostsテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|integer| null: false, foreign_key: true|
|room_id|integer| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :room

***

# rooms関連のテーブル

## roomsテーブル

|Column|Type|Options|
|------|----|-------|
|roomType_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|buildingTypes_id|integer|null: false, foreign_key: true|
|bathrooms_id|integer|null: false, foreign_key: true|
|experiences_id|integer|null: false, foreign_key: true|
|frequencys_id|integer|null: false, foreign_key: true|
|deadlines_id|integer|null: false, foreign_key: true|
|currencys_id|integer|null: false, foreign_key: true|
|capacity|integer|null: false|
|address|text|null: false|
|only_for_guest|boolean|null: false|
|bedroom_number|integer|null: false|
|bed_number|integer|null: false|
|check_in_from|string|null: false|
|check_in_to|string|null: false|
|min_lodging|integer|null: false|
|max_lodging|integer|null: false|
|day_fee|integer|null: false|
|child|boolean||
|child_not_reason|text||
|infant|boolean||
|infant_not_reason|text||
|pet|boolean||
|smoking|boolean||
|party|boolean||

### Association
- has_many :users , through: :favorites
- has_many :favarites
- has_many :users , through: :hosts
- has_many :hosts
- has_many :sharedSpaces , through: :sharedSpace_rooms
- has_many :sharedSpace_rooms
- has_many :amenities , through: :amenity_rooms
- has_many :amenity_rooms
- has_many :availableSpaces , through: :availableSpace_rooms
- has_many :availableSpace_rooms
- has_many :requirements , through: :requirement_rooms
- has_many :requirement_rooms
- has_many :notices , through: :notice_rooms
- has_many :notice_rooms
- has_many :messages , through: :user_messages
- has_many :user_messages
- has_many :favarites
- has_many :images
- has_many :calenders
- belongs_to :roomType
- belongs_to :category
- belongs_to :buildingType
- belongs_to :bathroom
- belongs_to :experience
- belongs_to :frequency
- belongs_to :deadline
- belongs_to :currency

# roomsと一対多のテーブル

## roomTypesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false , unique: true|

### Association
- has_many :rooms

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :rooms

## buildingTypesテーブル

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
|room_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :room

## experiencesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms

## frequencysテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique:true|

### Association
- has_many :rooms

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

### Association
- belongs_to :room

# roomsと多対多のテーブル

## sharedSpaces

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :sharedSpace_rooms
- has_many :sharedSpace_rooms


## amenitiesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :amenity_rooms
- has_many :amenity_rooms

## availableSpacesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|


### Association
- has_many :rooms, through: :availableSpace_rooms
- has_many :availableSpace_rooms


## requirementsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :requirement_rooms
- has_many :requirement_rooms


## noticesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :rooms, through: :notice_rooms
- has_many :notice_rooms


# 中間テーブル

## sharedSpace_roomsテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|sharedSpace_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :rooms
- belongs_to :sharedSpaces

## amenity_roomsテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|amenitie_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :rooms
- belongs_to :amenities

## availableSpace_roomsテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|availableSpace_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :rooms
- belongs_to :availableSpaces

## requirement_roomsテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|requirement_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :rooms
- belongs_to :requirements

## notice_roomsテーブル

|Column|Type|Options|
|------|----|-------|
|room_id|integer|null: false, foreign_key: true|
|notice_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :rooms
- belongs_to :notices

***

# 予約

## room_reservationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|room_id|integer|null: false, foreign_key: true|
|reservation_id|integer|null: false, foreign_key: true|
|check_in_date|date|null: false|
|check_out_date|date|null: false|
|number_of_adult|integer|null: false|
|number_of_child|integer||
|number_of_infant|integer||
|message|text|null: false||
|cleaning_fee|integer||
|service_fee|integer||
|total_fee|integer|null: false|

### Association
- belongs_to :user
- belongs_to :room
- belongs_to :reservation_status


## reservationStatusテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :room_reservations

***

# メッセージ関連

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string||
|body|text|null: false|
|messageStatus_id|integer|null: false, foreign_key: true|

### Association
- has_many :users , through: :user_messages
- has_many :user_messages
- belongs_to :messageStatus

## messageStatusesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false, unique: true|

### Association
- has_many :messages

## user_messagesテーブル

|Column|Type|Options|
|------|----|-------|
|send_user_id|integer|null: false, foreign_key: true|
|receive_user_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|

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
|costPerformance_rate|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|room_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :room

***

# お気に入り

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|room_id|integer||

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
