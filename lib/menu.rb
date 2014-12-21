require 'csv'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = []
    load_menu
  end

  def load_menu 
    CSV.foreach('menu.csv') do |line| 
    dish = line[0] ; price = line[1]
    @menu_list << {dish.delete(' ').to_sym => price.to_f}
    end
  end


end
