module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :meal_plans,
      [Types::MealPlanType],
      null: false,
      description: "Returns a list of meal plans"

    field :items,
      [Types::ItemType],
      null: false,
      description: "Returns a list of items, which could be one of (#{Item.item_types.keys.to_sentence})"

    def meal_plans
      MealPlan.all
    end

    def items
      Item.all
    end
  end
end
