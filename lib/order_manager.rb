class OrderManager

  attr_reader :customer_order, :menu_manager

  def initialize
    @customer_order = []
    @menu_manager = MenuManager.new
  end

  def confirm_order
    raise 'You need to add at least one dish to your order' if customer_order.empty?
    raise_confirmation_text
    puts 'You should receive an SMS confirming your order and expected delivery time'
  end

  def add_item_to_order(dish, quantity, cost)
    validate_dish(dish)
    validate_dish_cost(dish, quantity, cost)
    customer_order << {:dish => dish, :quantity => quantity.to_i, :cost => cost.to_f}
  end

  def validate_dish(dish)
    raise "Sorry #{dish} isn't on the menu" if menu_manager.menu.keys.include?(dish) == false 
  end

  def validate_dish_cost(dish, quantity, cost)
    raise 'Sorry the cost you entered is incorrect' if cost != quantity * menu_manager.menu[dish]
  end

  def view_order
    customer_order.each_with_index { |item, i| puts "#{i+1}. #{item[:dish]}, #{item[:quantity]}, #{item[:cost]}" }  
  end

  def delete_item(item_index)
    customer_order.delete_at(item_index)
  end

  def delete_entire_order
    customer_order.clear
  end

  def raise_confirmation_text(content = TextConfirmation)
    content.new.send_confirmation
  end



end