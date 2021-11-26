class Case < ApplicationRecord

  with_options presence: true do
    validates :point
    validates :timeframe
  end

  belongs_to :report
  belongs_to :staff
  # belongs_to :payment

  enum timeframe: {
    '--------': 0,
    '9:00-9:59': 1,
    '10:00-10:59': 2,
    '11:00-11:59': 3,
    '12:00-12:59': 4,
    '13:00-13:59': 5,
    '14:00-14:59': 6,
    '15:00-15:59': 7,
    '16:00-16:59': 8,
    '17:00-17:59': 9,
    '18:00-18:59': 10,
    '19:00-19:59': 11,
    '20:00-20:59': 12
  }

#booksテーブルのpriceカラムの合計値を求めたい場合
array = [] #空の配列を用意し、
  Case.all.each do |c|
    array << c.point
    #bookテーブルのレコードを１件ずつ取り出し、priceカラムのデータを配列に入れる
  end
array.sum

end
