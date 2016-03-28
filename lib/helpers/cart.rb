module BbInventoryHelpers
  module Cart
    # For this application, our cart is simply a hash consisting
    # of item_ids as keys and quantities as values.  The hash is 
    # saved as a session variable that the user should have  
    # available during the course of their interactions w/ system.

    def create_cart
      session[:cart] ||= Hash.new
    end

    def clear_cart
      session[:cart] = Hash.new
    end

    def destroy_cart
      session[:cart] = nil
    end

    def add_item_to_cart(item_id)
      if session[:cart].keys.include?(item_id)
        # if item in cart, increment quantity by 1
        session[:cart][item_id] += 1
      else
        # add it to the cart
        session[:cart][item_id] = 1
      end
    end

    def remove_item_from_cart(item_id)
      if session[:cart].keys.include?(item_id)
        session[:cart].delete(item_id)
      end
    end

    def get_list_of_items_in_cart
      basket_items = Array.new
      return basket_items if session[:cart].empty? # skip if cart empty...
      session[:cart].each do |item_id, quantity|
        info = {item_id: item_id, quantity: quantity}
        basket_item = BasketItem.new(info)
        basket_items << basket_item
      end
      basket_items    
    end

    def save_each_item_in_cart(basket)
      session[:cart].each do |item_id, quantity|
        info = {item_id: item_id, quantity: quantity, basket_id: basket.id}
        BasketItem.create(info)
      end
    end

  end
end
