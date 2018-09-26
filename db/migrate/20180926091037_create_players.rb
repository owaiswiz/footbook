class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :networth
      t.string :nationality
      t.integer :jersey_no
      t.integer :trophies
      t.integer :goals
      t.integer :assists
      t.integer :appearance
      t.integer :redcards
      t.integer :yellowcards

      t.timestamps
    end
  end
end
