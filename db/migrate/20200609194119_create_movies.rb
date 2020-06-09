class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :runtimeInMinutes
      t.integer :budgetInMillions
      t.integer :boxOfficeRevenueInMillions
      t.integer :academyAwardNominations
      t.integer :academyAwardWins
      t.string :api_id

      t.timestamps
    end
  end
end
