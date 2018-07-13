class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :content
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :words, [:category_id, :content]
  end
end
