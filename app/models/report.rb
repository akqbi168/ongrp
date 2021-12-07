class Report < ApplicationRecord

  has_many :cases, inverse_of: :report, dependent: :destroy
  # accepts_nested_attributes_for :cases, allow_destroy: true, reject_if: :reject_case
  accepts_nested_attributes_for :cases, allow_destroy: true

  has_many :payments

  belongs_to :user
  belongs_to :store, optional: true

  with_options presence: true do
    validates :date
    validates :store_id
  end



end
