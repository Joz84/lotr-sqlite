class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.integer :position
      t.string :title
      t.references :book, null: false, foreign_key: true
      t.string :api_id

      t.timestamps
    end
  end
end
