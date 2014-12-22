class OrderInterface

  attr_reader :customer_order

  def initialize
    @customer_order = []
    @menu_manager = MenuManager.new
  end

  def interactive_menu
    loop do
      print_options 
      process(STDIN.gets.chomp) 
    end
  end

  def print_options
    puts '1. View the menu'
    puts '2. Order a dish'
    puts '3. Confirm your order'
    puts '9. Exit'
  end

  def process(selection)
    case selection
    when '1' then menu.display_menu
    when '2' then capture_order
    when '3' then confirm_order
    when '9' then exit
    else puts 'Sorry that option doesn\'t exist, please try again'
    end
  end
  
  def capture_order
    puts 'What dish would you like?'
    dish = STDIN.gets.chomp
    puts "How many #{dish} would you like?"
    quantity = STDIN.gets.chomp
    puts 'How much is that?'
    cost = STDIN.gets.chomp
    customer_order << {:dish => dish, :quantity => quantity, :cost => cost}
  end

  def confirm_order
    validate_dishes 
    validate_cost
    raise_confirmation_text
    "You should receive an SMS confirming your order and expected delivery time"
  end

  def validate_dishes
    ordered_dishes = []
    customer_order.each { |line| ordered_dishes << line[:dish] }
    unlisted_items = ordered_dishes.reject { | dish | @menu_manager.menu_dishes.include?(dish) }
    raise 'Sorry at least one item you ordered isn\'t on the menu' if unlisted_items.length > 0
  end

  def validate_cost
    customer_order.each { |line| line[:price] = @menu_manager.menu[line[:dish].to_sym] }
    order_cost_total = customer_order.inject(0) { | memo, item | memo + item[:cost]}
    menu_order_cost = customer_order.inject(0) { | memo, item | memo + (item[:price] * item[:quantity])}
    raise 'Sorry the amount you entered is not correct' if order_cost_total != menu_order_cost 
  end

  def raise_confirmation_text(content = TextConfirmation)
    text_confirmation = content.new
    text_confirmtion.send_confirmation
  end


end
