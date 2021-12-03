class Job < ApplicationRecord

  belongs_to :rank, optional: true
  belongs_to :staff
  belongs_to :store, optional: true
  has_one :payment, dependent: :destroy

  with_options presence: true do
    validates :staff_id
    validates :date
    validates :time_start
    validates :time_end
  end

end
