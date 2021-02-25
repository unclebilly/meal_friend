class Item < ApplicationRecord
  enum item_type: { entree: 'entree', dessert: 'dessert', drink: 'drink', side: 'side'}
  validates :name, length: 0..500, presence: true
  validates :url, length: 0..2083, url: true, allow_nil: true
  validates :prep_offset_hours, numericality: :integer, allow_nil: true
end
