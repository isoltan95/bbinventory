class Basket < ActiveRecord::Base

	# Relationships
	has_many :basket_items
	has_many :items, through: :basket_items

	# Scopes
	scope :chronological, -> { order (checkout_date: :desc) }
	scope :for_date, -> (d) { where (date: d)}

	# Validations
	validates_date :checkout_date

end
