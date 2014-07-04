json.array!(@moves_pokemons) do |moves_pokemon|
  json.extract! moves_pokemon, :id, :pokemon_id, :move_id
  json.url moves_pokemon_url(moves_pokemon, format: :json)
end
