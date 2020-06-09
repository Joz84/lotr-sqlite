class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :dialog
      t.references :movie, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.string :api_id

      t.timestamps
    end
  end
end
