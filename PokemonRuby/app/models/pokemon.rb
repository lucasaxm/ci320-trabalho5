class Pokemon < ActiveRecord::Base
	belongs_to	:trainer
	has_and_belongs_to_many	:moves

	validates	:name, 	presence: true
	validates	:pokedex_number, presence: true, 
								 numericality: {
										only_integer: true,
										greater_than_or_equal_to: 1,
										less_than_or_equal_to: 386
								 }
	validates	:poketype, 	presence: true
end
