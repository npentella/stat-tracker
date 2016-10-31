class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.integer :points
      t.integer :rebounds
      t.integer :assists
      t.integer :blocks
      t.integer :steals
      t.integer :fouls

      t.timestamps
    end
  end
end
