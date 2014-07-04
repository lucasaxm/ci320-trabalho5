class CreateMovesPokemons < ActiveRecord::Migration
  def change
    create_table :moves_pokemons do |t|
      t.integer :pokemon_id
      t.integer :move_id

      t.timestamps
    end
  end
end
