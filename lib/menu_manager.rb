require 'csv'

class MenuManager

  attr_reader :menu, :menu_dishes

  def initialize
    @menu = {}
    @menu_dishes = []
    load_menu
  end

  def load_menu 
    CSV.foreach('menu.csv') do |line| 
      dish = line[0] ; price = line[1]
      @menu[dish] = price.to_f
      @menu_dishes = menu.keys.to_s
    end
  end

  def display_menu
    puts 'Welcome to Andy\'s Takeaway'
    menu.each { |k, v| puts "#{k.to_s} - #{v.to_f}"}
  end

end