# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Rank.create(
  name: 'Staff(C)',
  per_hour: 1300,
  requirements: "まずはこの時給から\n（トータル獲得件数が30件未満）\n※ 飛び込み分は×3カウント"
)
Rank.create(
  name: 'Staff(B)',
  per_hour: 1400,
  requirements: "一人で獲得できる\n（トータル獲得件数31件～50件）"
)
Rank.create(
  name: 'Staff(A)',
  per_hour: 1500,
  requirements: "他の人をフォローできる\n（トータル獲得件数50件以上）"
)
Rank.create(
  name: 'Lead(B)',
  per_hour: 1600,
  requirements: "リーダー見習い\n直近3日間契約\n　平均5件以上 or 2件以上/時間\n　and\n　シフト週3日間以上入る"
)
Rank.create(
  name: 'Lead(A)',
  per_hour: 1700,
  requirements: "リーダー\n直近3日間契約\n　平均6件以上 or 2.5件以上/時間\n　and\n　シフト週4日間以上入る"
)
Rank.create(
  name: 'Director',
  per_hour: 1800,
  requirements: "ディレクター\n上長面談の上、目標達成力、リーダーシップ等を考慮し主幹の承認を経て決定"
)




Bounty.create!(
  [
    { staff_c:   50, staff_b:    0, staff_a:    0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0 },
    { staff_c:  100, staff_b:    0, staff_a:    0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0 },
    { staff_c:  500, staff_b:    0, staff_a:    0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0 },
    { staff_c: 1000, staff_b: 1000, staff_a:    0, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0 },
    { staff_c: 1500, staff_b: 1500, staff_a: 1500, lead_b: 0, lead_a: 0, director: 0, ratio: 0.0 },

    { staff_c: 2000, staff_b: 2000, staff_a: 2000, lead_b:    0, lead_a:    0, director: 0, ratio: 0.0 },
    { staff_c: 2500, staff_b: 2500, staff_a: 2500, lead_b: 2500, lead_a:    0, director: 0, ratio: 0.0 },
    { staff_c: 3000, staff_b: 3000, staff_a: 3000, lead_b: 3000, lead_a:    0, director: 0, ratio: 0.0 },
    { staff_c: 5000, staff_b: 5000, staff_a: 5000, lead_b: 5000, lead_a: 5000, director: 0, ratio: 0.0 },
    { staff_c: 5500, staff_b: 5500, staff_a: 5500, lead_b: 5500, lead_a: 5500, director: 0, ratio: 0.0 },

    { staff_c: 6000, staff_b: 6000, staff_a: 6000, lead_b: 6000, lead_a: 6000, director: 0, ratio: 0.0 },
    { staff_c: 6500, staff_b: 6500, staff_a: 6500, lead_b: 6500, lead_a: 6500, director: 0, ratio: 0.0 },
    { staff_c: 7000, staff_b: 7000, staff_a: 7000, lead_b: 7000, lead_a: 7000, director: 0, ratio: 0.0 },
    { staff_c: 7500, staff_b: 7500, staff_a: 7500, lead_b: 7500, lead_a: 7500, director: 0, ratio: 0.0 },
    { staff_c: 8000, staff_b: 8000, staff_a: 8000, lead_b: 8000, lead_a: 8000, director: 0, ratio: 0.5 },

    { staff_c:  8500, staff_b:  8500, staff_a:  8500, lead_b:  8500, lead_a:  8500, director: 0, ratio: 0.7 },
    { staff_c:  9000, staff_b:  9000, staff_a:  9000, lead_b:  9000, lead_a:  9000, director: 0, ratio: 0.7 },
    { staff_c: 10000, staff_b: 10000, staff_a: 10000, lead_b: 10000, lead_a: 10000, director: 0, ratio: 0.9 },
    { staff_c: 12500, staff_b: 12500, staff_a: 12500, lead_b: 12500, lead_a: 12500, director: 0, ratio: 0.9 },
    { staff_c: 15000, staff_b: 15000, staff_a: 15000, lead_b: 15000, lead_a: 15000, director: 0, ratio: 1.0 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.0 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.0 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.2 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.2 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.2 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.4 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.4 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.4 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.7 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.7 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.7 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.9 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.9 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 1.9 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.0 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.0 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.0 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.1 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.1 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.1 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.2 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.2 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.2 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.3 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.3 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.3 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },

    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 },
    { staff_c: 0, staff_b: 0, staff_a: 0, lead_b: 0, lead_a: 0, director: 0, ratio: 2.5 }
  ]
)



Store.create(name: 'テスト店舗')
Store.create(name: 'お店２２２２')
Store.create(name: 'オニゴーストア北３条店前')

Staff.create(name: '田中　太郎', rank_id: 1)
Staff.create(name: 'ドリンドルレナ', rank_id: 2)
Staff.create(name: 'ヴエンヅエイジ', rank_id: 3)

