# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  user_id: 'admin',
  password: 'admin0987654321',
  name: 'admin',
  account_level: 6
)
User.create(
  user_id: 'test',
  password: 'test11',
  name: 'テストくん',
  account_level: 6
)
User.create(
  user_id: 'ohi01',
  password: 'nekomimi',
  name: '大井佑基',
  account_level: 5
)
User.create(
  user_id: 'pomatokanri',
  password: 'pmtkanri12',
  name: 'ポマト管理',
  account_level: 4
)
User.create(
  user_id: 'pomato01',
  password: 'pomato01',
  name: 'ポマト共有アカウント',
  account_level: 3
)
User.create(
  user_id: 'onigo55',
  password: 'onigo02555',
  name: 'OniGOご担当者様',
  account_level: 2
)
User.create(
  user_id: 'director',
  password: 'director3p',
  name: 'ディレクター画面',
  account_level: 1
)
User.create(
  user_id: 'furuya01',
  password: 'furuyan001',
  name: 'OniGO現場ディレクター古屋',
  account_level: 1
)



Rank.create(
  name: 'Staff(C)',
  per_hour: 1300,
  requirements: '昇級条件'
)
Rank.create(
  name: 'Staff(B)',
  per_hour: 1400,
  requirements: '昇級条件'
)
Rank.create(
  name: 'Staff(A)',
  per_hour: 1500,
  requirements: '昇級条件はいろいろあります。'
)
Rank.create(
  name: 'Lead(B)',
  per_hour: 1600,
  requirements: 'リーダーですね'
)
Rank.create(
  name: 'Lead(A)',
  per_hour: 1700,
  requirements: 'かなりの手練れですね'
)
Rank.create(
  name: 'Director',
  per_hour: 1800,
  requirements: '所謂プレイングマネージャー型ではありません'
)


Store.create(name: 'オニゴー倉庫０１')
Store.create(name: 'お店２２２２')
Store.create(name: 'オニゴーストア北３条店前')

Staff.create(name: '田中　太郎', rank_id: 1)
Staff.create(name: 'ドリンドルレナ', rank_id: 2)
Staff.create(name: 'ヴエンヅエイジ', rank_id: 3)

# Job.create()

