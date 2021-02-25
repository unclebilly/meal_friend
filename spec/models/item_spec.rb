require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should define_enum_for(:item_type).
        with_values(
          entree: 'entree',
          dessert: 'dessert',
          drink: 'drink',
          side: 'side'
        ).backed_by_column_of_type(:enum)}

  it { should allow_values(:entree, :dessert, :drink, :side).for(:item_type) }

  it { should validate_length_of(:name).is_at_most(500) }
  it { should validate_presence_of(:name) }

  it { should validate_length_of(:url).is_at_most(2083).allow_nil }
  it { is_expected.to validate_url_of(:url) }
  it { should validate_numericality_of(:prep_offset_hours).allow_nil}
end
