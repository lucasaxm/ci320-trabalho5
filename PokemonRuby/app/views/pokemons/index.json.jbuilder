json.array!(@pokemons) do |pokemon|
  json.extract! pokemon, :id, :name, :pokedex_number, :poketype, :n_moves, :trainer_id
  json.url pokemon_url(pokemon, format: :json)
end
