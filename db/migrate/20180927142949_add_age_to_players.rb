class AddAgeToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :age, :integer, default: 0
  end
end
