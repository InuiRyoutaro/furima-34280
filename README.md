# README
# テーブル設計

## users　テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| nick_name             | string | null: false |　　
| email                 | string | null: false, unique: true|
| encrypted_password    | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_japanese  | string | null: false |
| first_name_japanese   | string | null: false |
| birth_day             | date   | null: false |

Association
・has_many : items
・has_many :purchase



## buyers　テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| post_code　　　　　　   | string | null: false |
| prefecture_id　　　　  | integer| null: false |
| city　　　　　　  　　　 | string | null: false |
| address　　　　　　     | string | null: false |
| building_name　　　　  | string | |
| phone_number　　　　   | string | null: false |

Association
・belongs_to :purchase


## purchase テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| user_id               | integer| null: false, foreign_key: true|
| item_id               | integer| null: false, foreign_key: true|


Association
・belongs_to :buyers
・has_one :item
・belongs_to :user


## items テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| name                  | string | null: false |
| price                 | integer| null: false |
| user_id               | integer| null: false, foreign_key: true|
| prefecture_id　　　　  | integer| null: false |
| category_id           | integer| null: false |
| description           | text   | null: false |
| item_condition_id     | integer| null: false |
| shipping_cost_id      | integer| null: false |
| shipping_day _id      | integer| null: false |

Association
・belongs_to :user
・has_one :purchase



