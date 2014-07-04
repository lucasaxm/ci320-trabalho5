class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.integer :pokeballs
      t.integer :potions
      t.integer :trainer_id

      t.timestamps
    end
  end
end
