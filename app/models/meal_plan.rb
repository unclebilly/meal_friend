class MealPlan < ApplicationRecord
  validates :end_at, presence: true
  validates :start_at, presence: true
  validate :start_before_end

  def start_before_end
    if(start_at && end_at) && end_at <= start_at
      errors.add(:end_at, "must be after start_at")
    end
  end
end
