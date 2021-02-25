class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string   :name, null: false
      t.string   :url
      t.string   :prep_text
      t.text     :description
      t.integer  :prep_offset_hours
      t.timestamps
    end
  end
end
