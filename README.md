# README
# テーブル設計

## users　テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| nick_name             | string | null: false |　　#memo null: false　→　ないと困るよー
| email                 | string | null: false |
| user_password         | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_japanese  | string | null: false |
| first_name_japanese   | string | null: false |
| birth_day             | date   | null: false |
| phone_number          | string |             |

Association
・has_many :items dependent: :destroy
・belongs_to :users(購入者) dependent: :destroy
・belongs_to :credit_card dependent: :destroy





## buyers　テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| user_id               | text   | null: false, foreign_key: true|
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_japanese  | string | null: false |
| first_name_japanese   | string | null: false |
| phone_number          | string |             |

Association
・belongs_to :user





## credit_cards テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| user_id               | integer| null: false, foreign_key: true|
| credit_cards_id       | string | null: false |
| phone_number          | string | null: false |

Association
・belongs_to :user



## items テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| name                  | string | null: false |
| price                 | string | null: false |
| item_categories_id    | integer| null: false, foreign_key: true|
| user_id               | integer| null: false, foreign_key: true|

Association
・belongs_to :user dependent: :destroy
・belongs_to :items_categories  dependent: :destroy
・has_many :images dependent: :destroy



## Items_categories テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| name                  | string | null: false |

Association
・has_many :items



## Image テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| image                 | string | null: false |
| item_id               | integer| null: false, foreign_key: true|

Association
・belongs_to :items
