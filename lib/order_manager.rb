class OrderManager

  attr_reader :customer_order, :menu_manager

  def initialize
    @customer_order = []
    @menu_manager = MenuManager.new
  end

  def confirm_order
    raise 'You need to add at least one dish to your order' if customer_order.empty?
    validate_dishes 
    validate_cost
    raise_confirmation_text
    puts 'You should receive an SMS confirming your order and expected delivery time'
  end

  def view_order
    customer_order.each_with_index { |item, i| puts "#{i+1}. #{item[:dish]}, #{item[:quantity]}, #{item[:cost]}" }  
  end

  def delete_item
    view_order
    puts 'Which line item would you like to delete?'
    customer_order.delete_at(STDIN.gets.chomp.to_i - 1)
  end

  def delete_entire_order
    customer_order.clear
  end

  def validate_dishes
    ordered_dishes = []
    customer_order.each { |line| ordered_dishes << line[:dish] }
    unlisted_items = ordered_dishes.reject { | dish | menu_manager.menu_dishes.include?(dish) }
    raise "Sorry #{unlisted_items.join(", ")} isn't on the menu" if unlisted_items.empty? == false
  end

  def validate_cost
    customer_order.each { |line| line[:price] = menu_manager.menu[line[:dish].to_sym] }
    order_cost_total = customer_order.inject(0) { | memo, item | memo + item[:cost]}
    menu_order_cost = customer_order.inject(0) { | memo, item | memo + (item[:price] * item[:quantity])}
    raise 'Sorry the amount you entered is not correct' if order_cost_total != menu_order_cost 
  end

  def raise_confirmation_text(content = TextConfirmation)
    content.new.send_confirmation
  end

end