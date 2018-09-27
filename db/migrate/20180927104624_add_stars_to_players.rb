class AddStarsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :five_stars, :integer, default: 0
    add_column :players, :four_stars, :integer, default: 0
    add_column :players, :three_stars, :integer, default: 0
    add_column :players, :two_stars, :integer, default: 0
    add_column :players, :one_stars, :integer, default: 0
  end
end
