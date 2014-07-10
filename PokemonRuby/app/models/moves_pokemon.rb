class MovesPokemon < ActiveRecord::Base
	belongs_to	:pokemons
	belongs_to	:moves
end
