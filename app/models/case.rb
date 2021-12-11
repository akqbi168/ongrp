class Case < ApplicationRecord

  with_options presence: true do
    validates :point, numericality: { greater_than: 0, less_than_or_equal_to: 1}
    validates :timeframe
    validates :staff_id
  end

  belongs_to :report
  belongs_to :staff

  enum timeframe: {
    '09:00-09:59': 0,
    '10:00-10:59': 1,
    '11:00-11:59': 2,
    '12:00-12:59': 3,
    '13:00-13:59': 4,
    '14:00-14:59': 5,
    '15:00-15:59': 6,
    '16:00-16:59': 7,
    '17:00-17:59': 8,
    '18:00-18:59': 9,
    '19:00-19:59': 10,
    '20:00-20:59': 11,
    '不明／その他': 12
  }

end
