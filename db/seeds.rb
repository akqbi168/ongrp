# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  user_id: 'master',
  password: '0987654321',
  name: 'master'
)
User.create(
  user_id: 'test',
  password: 'test11',
  name: 'テストくん'
)


Store.create(name: '店舗１')
Store.create(name: 'お店２２２２')
Store.create(name: '鬼ゴーストア北店')

Staff.create(name: '田中　太郎', rank: 'Staff_C')
Staff.create(name: 'ドリンドルレナ', rank: 'Staff_A')
Staff.create(name: 'ヴエンヅエイジ', rank: 'Lead_B')
