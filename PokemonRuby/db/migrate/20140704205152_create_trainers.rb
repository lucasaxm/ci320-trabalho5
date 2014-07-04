class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :city
      t.integer :badges

      t.timestamps
    end
  end
end
