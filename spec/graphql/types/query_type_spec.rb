# spec/graphql/types/query_type_spec.rb
require "rails_helper"

RSpec.describe Types::QueryType do
  describe "meal_plans" do
    let!(:meal_plans) { 
      [MealPlan.create!(start_at: DateTime.now-10.days, end_at: DateTime.now)]
    }

    let(:query) do
      %(query {
        mealPlans {
          startAt
          endAt
        }
      })
    end

    subject(:result) do
      MealFriendSchema.execute(query).as_json
    end

    it "returns all items" do
      expect(result.dig("data", "mealPlans")).to match_array(
        meal_plans.map { |mp| { "startAt" => mp.start_at.iso8601, "endAt" => mp.end_at.iso8601 } }
      )
    end
  end
end
