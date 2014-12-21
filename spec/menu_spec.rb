require 'menu'

describe Menu do 

let(:menu){Menu.new}

  it 'should load the menu' do
    expect(menu.menu_list.length).to be > 0
  end

  it 'should raise an error if an item ordered is not on the menu' do
    expect{menu.validate_dishes(["Banana"])}.to raise_error(RuntimeError, "[\"Banana\"] are not on the menu, please reorder")
  end

  it 'should return false if the total for the ordered items is not correct' do
    expect(menu.validate_cost([{:dish => "Pad Thai", :quantity => 3, :cost => 30}, {:dish => "Red Curry", :quantity => 2, :cost => 15.5}])).to be false
  end
  
  it 'should return true if passed an order where payment is correct' do
    expect(menu.validate_cost([{:dish => "Pad Thai", :quantity => 3, :cost => 26.25}, :dish => "Red Curry", :quantity => 2, :cost => 14.5])).to be true
  end

end