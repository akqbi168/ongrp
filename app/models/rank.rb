class Rank < ApplicationRecord

  has_many :jobs
  has_many :staffs

  with_options presence: true do
    validates :name
    validates :per_hour
  end

end
