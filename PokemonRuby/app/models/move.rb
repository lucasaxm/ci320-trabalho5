class Move < ActiveRecord::Base
	has_and_belongs_to_many :pokemons

	validates	:name,	presence: true,
						numericality: false,
						uniqueness: true
	validates	:movetype,	presence: true
	validates	:category,	presence: true
end
