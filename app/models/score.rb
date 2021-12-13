class Score < ApplicationRecord

  belongs_to :case
  # belongs_to :report, through: :case
  # has_one :report, through: :case
  belongs_to :staff

  with_options presence: true do
    validates :staff_id
    # validates :point, numericality: { greater_than: 0, less_than_or_equal_to: 1}
    validates :point, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1}
  end

end
