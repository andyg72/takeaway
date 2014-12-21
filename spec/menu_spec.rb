require 'menu'

describe Menu do 

let(:menu){Menu.new}

  it 'should load the menu' do
    expect(menu.menu_list.length).to be > 0
  end

  it 'should raise an error if an item ordered is not on the menu' do
    expect{menu.validate_dishes([:Banana])}.to raise_error(RuntimeError, "[:Banana] are not on the menu, please reorder")
  end

  it 'should raise an error if the total for the ordered items is not correct' do
    expect{menu.validate_cost([:PadThai, 3, 30])}.to raise_error(RuntimeError, "Payment should be 26.25")
  end
  
  it 'should return true if passed an order where payment is correct' do
    expect(menu.validate_cost([:PadThai, 3, 26.25])).to be true
  end

end