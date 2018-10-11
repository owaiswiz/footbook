class AddAvgStarsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :avg_stars, :float
  end
end
