module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :url, String, null: true
    field :prep_text, String, null: true
    field :description, String, null: true
    field :prep_offset_hours, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :item_type, Types::ItemTypeType, null: false
  end
end
