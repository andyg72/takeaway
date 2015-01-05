require 'csv'

class MenuManager

  attr_reader :menu

  def initialize
    @menu = {}
    load_menu
  end

  def load_menu 
    CSV.foreach('menu.csv') do |line| 
      dish = line[0] ; price = line[1]
      @menu[dish] = price.to_f
    end
  end

  def display_menu
    puts 'Andy\'s Takeaway'
    menu.each { |k, v| puts "#{k} - #{v}"}
  end

end