class Store < ApplicationRecord

  has_many :reports
  has_many :jobs

  with_options presence: true do
    validates :name
  end

end
