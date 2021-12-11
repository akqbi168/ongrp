class Bounty < ApplicationRecord

  with_options presence: true do
    validates :staff_c
    validates :staff_b
    validates :staff_a
    validates :lead_b
    validates :lead_a
    validates :director
    validates :ratio
  end

end
