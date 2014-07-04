class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.string :movetype
      t.string :category

      t.timestamps
    end
  end
end
