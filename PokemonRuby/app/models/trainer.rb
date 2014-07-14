class Trainer < ActiveRecord::Base
	has_many	:pokemons
	has_one		:bag, dependent: :destroy
	validates :name, presence: true, uniqueness: true
	validates :city, presence: true
	validates :badges, 	presence: true,
						numericality: {
								only_integer: true,
								greater_than_or_equal_to: 0,
								less_than_or_equal_to: 8
						}

end