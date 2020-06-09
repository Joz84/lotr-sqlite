class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.references :chapter, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.string :api_id

      t.timestamps
    end
  end
end
