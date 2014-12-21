class OrderInterface

  attr_reader :customer_order, :menu, :menu_dishes

  def initialize
    @customer_order = []
    @menu = {}
    @menu_dishes = []
    load_menu
  end

  def load_menu 
    CSV.foreach('menu.csv') do |line| 
      dish = line[0] ; price = line[1]
      @menu[dish.to_sym] = price.to_f
      @menu_dishes = menu.keys.to_s
    end
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
    menu.each { |k, v| puts "#{k.to_s} - #{v.to_f}"}
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
    validate_dishes(customer_order) 
    validate_cost(customer_order)
  end

  def validate_dishes
    ordered_dishes = []
    customer_order.each { |line| ordered_dishes << line[:dish] }
    unlisted_items = ordered_dishes.reject { | dish | menu_dishes.include?(dish) }
    unlisted_items.length > 0 ? false : true
  end

  def validate_cost
    customer_order.each { |line| line[:price] = menu[line[:dish].to_sym] }
    order_cost_total = customer_order.inject(0) { | memo, item | memo + item[:cost]}
    menu_order_cost = customer_order.inject(0) { | memo, item | memo + (item[:price] * item[:quantity])}
    order_cost_total == menu_order_cost ? true : false
  end

end
