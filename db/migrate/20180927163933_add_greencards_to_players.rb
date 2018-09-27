class AddGreencardsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :greencards, :integer
  end
end
