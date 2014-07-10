class Pokemon < ActiveRecord::Base
	belongs_to	:trainer
	has_and_belongs_to_many	:moves

	validates	:name, 	presence: true
	validates	:pokedex_number, 	presence: true, 
									numericality: {only_integer: true}
	validates	:poketype, 	presence: true
	validates	:n_moves, 	presence: true,
							numericality: {only_integer: true},
							length: { in: 0..4 }
end
