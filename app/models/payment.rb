class Payment < ApplicationRecord

  with_options optional: true do
    belongs_to :job
    belongs_to :staff
    belongs_to :report
  end

  with_options presence: true do
    validates :date
    validates :staff_id
  end

end
