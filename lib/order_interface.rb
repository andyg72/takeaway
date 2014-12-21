class OrderInterface

  attr_reader :customer_order, :menu

  def initialize
    @customer_order = []
    @menu = Menu.new
    display_menu
    interactive_menu
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
    when '1' then display_menu
    when '2' then capture_order
    when '3' then confirm_order
    when '9' then exit
    else puts 'Sorry that option doesn\'t exist, please try again'
    end
  end
  
  def display_menu
    puts 'Welcome to Andy\'s Takeaway'
    menu.menu_list.each { |k, v| puts "#{k.to_s} - #{v.to_f}"}
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
    order_validation = OrderValidation.new
    order_validation.validate_dishes(customer_order) 
    order_validation.validate_cost(customer_order)
  end
end
