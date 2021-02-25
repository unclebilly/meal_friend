class AddItemTypeEnum < ActiveRecord::Migration[6.1]
  def change
    create_enum :item_type, %w(entree dessert drink side)

    add_column :items, :item_type, :item_type
  end
end
