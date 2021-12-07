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
  password: 'director33',
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

# ====


# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)

# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)
# Bounty.create(staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0)

# [
#   [  50,    0,    0, 0, 0, 0, 0.5],
#   [ 100,    0,    0, 0, 0, 0, 0.5],
#   [ 500,    0,    0, 0, 0, 0, 0.5],
#   [1000, 1000,    0, 0, 0, 0, 0.5],
#   [1500, 1500, 1500, 0, 0, 0, 0.5],

#   [2000, 2000, 2000,    0,    0, 0, 0.5],
#   [2500, 2500, 2500, 2500,    0, 0, 0.5],
#   [3000, 3000, 3000, 3000,    0, 0, 0.5],
#   [5000, 5000, 5000, 5000, 5000, 0, 0.5],
#   [5500, 5500, 5500, 5500, 5500, 0, 0.5],

#   [6000, 6000, 6000, 6000, 6000, 0, 0.5],
#   [6500, 6500, 6500, 6500, 6500, 0, 0.5],
#   [7000, 7000, 7000, 7000, 7000, 0, 0.5],
#   [7500, 7500, 7500, 7500, 7500, 0, 0.5],
#   [8000, 8000, 8000, 8000, 8000, 0, 0.5],

#   [ 8500,  8500,  8500,  8500,  8500, 0, 0.7],
#   [ 9000,  9000,  9000,  9000,  9000, 0, 0.7],
#   [10000, 10000, 10000, 10000, 10000, 0, 0.9],
#   [12500, 12500, 12500, 12500, 12500, 0, 0.9],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.0],

#   [15000, 15000, 15000, 15000, 15000, 0, 1.0],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.0],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.2],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.2],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.2],

#   [15000, 15000, 15000, 15000, 15000, 0, 1.4],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.4],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.4],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.5],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.5],

#   [15000, 15000, 15000, 15000, 15000, 0, 1.5],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.7],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.7],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.7],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.9],

#   [15000, 15000, 15000, 15000, 15000, 0, 1.9],
#   [15000, 15000, 15000, 15000, 15000, 0, 1.9],
#   [15000, 15000, 15000, 15000, 15000, 0, 2.0],
#   [15000, 15000, 15000, 15000, 15000, 0, 2.0],
#   [15000, 15000, 15000, 15000, 15000, 0, 2.0],

#   [0, 0, 0, 0, 0, 0, 2.1],
#   [0, 0, 0, 0, 0, 0, 2.1],
#   [0, 0, 0, 0, 0, 0, 2.1],
#   [0, 0, 0, 0, 0, 0, 2.2],
#   [0, 0, 0, 0, 0, 0, 2.2],

#   [0, 0, 0, 0, 0, 0, 2.2],
#   [0, 0, 0, 0, 0, 0, 2.3],
#   [0, 0, 0, 0, 0, 0, 2.3],
#   [0, 0, 0, 0, 0, 0, 2.3],
#   [0, 0, 0, 0, 0, 0, 2.5]
# ].each do |s_c, s_b, s_a, l_b, l_a, d, r|
#   Bounty.create!(
#     { staff_c: s_c, staff_b: s_b, staff_a: s_a, lead_b: l_b, lead_a: l_a, director: d, ratio: r }
#   )


