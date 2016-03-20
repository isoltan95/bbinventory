class BasketItem < ActiveRecord::Base

	# Relationships
	belongs_to :basket 
	belongs_to :item 

	# Validations
	validates_numericality_of :quantity, only_integer: true, greater_than: 0
	validate :item_in_inventory

	# Methods
	private
	def item_in_inventory
		all_item_ids = Item.in_stock.map(&:id)
		unless all_item_ids.include?(self.item_id)
			errors.add(:item, "is not in stock")
		end
	end
end

