class Move < ActiveRecord::Base
	has_and_belongs_to_many :pokemons
end
