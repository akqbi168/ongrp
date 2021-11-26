class Staff < ApplicationRecord

  has_many :cases
  # has_many :payments

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
