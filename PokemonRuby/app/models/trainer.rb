class Trainer < ActiveRecord::Base
	has_many	:pokemons
	has_one		:bag
	validates :name, presence: true, uniqueness: true
	validates :city, presence: true
	validates :badges, 	presence: true,
						numericality: {only_integer: true}

end
