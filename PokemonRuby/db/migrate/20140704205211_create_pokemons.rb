class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_number
      t.string :poketype
      t.integer :n_moves
      t.integer :trainer_id

      t.timestamps
    end
  end
end
