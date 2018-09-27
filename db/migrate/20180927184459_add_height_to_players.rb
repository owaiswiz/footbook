class AddHeightToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :height, :integer, default: 0
  end
end
