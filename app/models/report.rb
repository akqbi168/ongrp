class Report < ApplicationRecord

  has_many :cases, inverse_of: :report
  accepts_nested_attributes_for :cases, allow_destroy: true
  belongs_to :user
  belongs_to :store

end
