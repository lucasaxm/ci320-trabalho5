class Pokemon < ActiveRecord::Base
	belongs_to	:trainer
	has_and_belongs_to_many	:moves
end
