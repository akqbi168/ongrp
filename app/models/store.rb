class Store < ApplicationRecord

  has_many :reports
  has_many :jobs

end
