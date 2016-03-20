class CartsController < ApplicationController

	include BbInventoryHelpers::Cart

	def add_to_cart
		@item = Item.find(params[:id])
		add_item_to_cart(@item.id)
		redirect_to show_cart_path
	end

	def show_cart
		@basket_items_in_cart = get_list_of_items_in_cart
		# @cart_total = calculate_cart_items_cost
		# @cart_shipping_cost = calculate_cart_shipping
		# @grand_total = @cart_shipping_cost + @cart_total
		render 'show_cart'
	end

	def remove_item
		@item = Item.find(params[:id])
		remove_item_from_cart(@item.id)
		redirect_to show_cart_path
	end

	def clear
		clear_cart
		redirect_to items_path, notice: "Cleared cart"
	end

end

