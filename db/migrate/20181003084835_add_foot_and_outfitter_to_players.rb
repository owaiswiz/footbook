class AddFootAndOutfitterToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :outfitter, :string
    add_column :players, :foot, :string
  end
end
