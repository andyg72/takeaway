require 'csv'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {}
    load_menu
  end

  def load_menu 
    CSV.foreach('menu.csv') do |l| 
      dish = l[0] ; price = l[1]
      @menu_list[dish.delete(' ').to_sym] = price.to_f
    end
  end

  def validate_dishes(order_dishes)
    unlisted_items = order_dishes.reject { |d| menu_list.keys.include?(d) }
    raise "#{unlisted_items} are not on the menu, please reorder" if order_dishes & menu_list.keys != order_dishes
  end

  def validate_cost(order_all)
    
  end

end
