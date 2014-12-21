require 'csv'

class Menu

  attr_reader :menu_list, :menu_dishes

  def initialize
    @menu_list = {}
    @menu_dishes = []
    load_menu
  end

  def load_menu 
    CSV.foreach('menu.csv') do |line| 
      dish = line[0] ; price = line[1]
      @menu_list[dish.to_sym] = price.to_f
      @menu_dishes = menu_list.keys.to_s
    end
  end

end
