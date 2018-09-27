class AddClubToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :club, :string
  end
end
