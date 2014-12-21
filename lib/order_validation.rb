class OrderValidation

  # attr_reader :customer_order, :menu

  def initialize
    # @customer_order = [{:dish => "Pad Thai", :quantity => 3, :cost => 30}, {:dish => "Red Curry", :quantity => 2, :cost => 15.5}, {:dish => "Banana", :quantity => 3, :cost => 30}]
    # @menu = Menu.new
  end

  def validate_dishes(customer_order)
    ordered_dishes = []
    customer_order.each { |line| ordered_dishes << line[:dish] }
    unlisted_items = ordered_dishes.reject { | dish | menu.menu_dishes.include?(dish) }
    unlisted_items.length > 0 ? false : true
  end

  def validate_cost(customer_order)
    customer_order.each { |line| line[:price] = menu.menu_list[line[:dish].to_sym] }
    order_cost_total = customer_order.inject(0) { | memo, item | memo + item[:cost]}
    menu_order_cost = customer_order.inject(0) { | memo, item | memo + (item[:price] * item[:quantity])}
    order_cost_total == menu_order_cost ? true : false
  end

end