class Staff < ApplicationRecord

  belongs_to :rank
  has_many :cases
  has_many :jobs
  has_many :payments

  with_options presence: true do
    validates :name
    validates :rank_id
  end

  enum rank: {
    '未設定': 0,
    Staff_C: 1,
    Staff_B: 2,
    Staff_A: 3,
    Lead_B: 4,
    Lead_A: 5,
    Director: 6
  }

end
