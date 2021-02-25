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

    it "returns all MealPlans" do
      expect(result.dig("data", "mealPlans")).to match_array(
        meal_plans.map { |mp| { "startAt" => mp.start_at.iso8601, "endAt" => mp.end_at.iso8601 } }
      )
    end
  end

  describe "items" do
    let!(:items) {
      [Item.create!(name: "Jelly Spaghetti")]
    }

    let(:query) do 
      %(query {
        items {
          name
        }
      })
    end

    subject(:result) do 
      MealFriendSchema.execute(query).as_json
    end

    it "returns all Items" do
      expect(result.dig("data", "items")).to match_array(
        items.map {|i| {"name" => i.name }}
      )
    end
  end
end
