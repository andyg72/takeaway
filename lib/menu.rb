require 'csv'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {}
    load_menu
  end

  def load_menu 
    CSV.foreach('menu.csv') do |line| 
      dish = line[0] ; price = line[1]
      @menu_list[dish.to_sym] = price.to_f
    end
  end

  def validate_dishes(order_dishes)
    unlisted_items = order_dishes.reject { |order_dish| menu_list.keys.include?(order_dish) }
    raise "#{unlisted_items} are not on the menu, please reorder" if unlisted_items != nil
  end

  def validate_cost(order_all)
    order_all.each { |line| line[:price] = menu_list[line[:dish].to_sym] }
    order_cost_total = order_all.inject(0) { | memo, item | memo + item[:cost]}
    menu_order_cost = order_all.inject(0) { | memo, item | memo + (item[:price] * item[:quantity])}
    order_cost_total == menu_order_cost ? true : false
  end

end
