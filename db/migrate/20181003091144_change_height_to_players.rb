class ChangeHeightToPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :age, :float, default: 0
  end
end
