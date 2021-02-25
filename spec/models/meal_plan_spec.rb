require 'rails_helper'

RSpec.describe MealPlan, type: :model do
  subject { 
    described_class.new(
      start_at: DateTime.now - 10.days,
      end_at: DateTime.now
    )
  }

  it 'is not valid without a start_at' do
    subject.start_at = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a end_at' do
    subject.end_at = nil
    expect(subject).to_not be_valid
  end
  
  it 'is not valid if end is before start' do 
    subject.end_at = subject.start_at - 10.days
    expect(subject).to_not be_valid
  end

  it 'is valid with happy path' do 
    expect(subject).to be_valid
  end
end
