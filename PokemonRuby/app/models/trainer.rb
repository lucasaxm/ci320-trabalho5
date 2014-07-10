class Trainer < ActiveRecord::Base
	has_many	:pokemons
	has_one		:bag
end
