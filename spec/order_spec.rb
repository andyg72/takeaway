require 'order'

describe Order do
  
  let(:order){Order.new}

  it 'should return false if an item ordered is not on the menu' do
    allow(order).to receive(:customer_order).and_return([{:dish => "Banana", :quantity => 3, :cost => 30}])
    expect(order.validate_dishes).to be false
  end

  it 'should return false if the total for the ordered items is not correct' do
    allow(order).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}, {:dish => "Red Curry", :quantity => 2, :cost => 15.5}])
    expect(order.validate_cost).to be false
  end
  
  it 'should return true if passed an order where payment is correct' do
    allow(order).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 26.25}, :dish => "Red Curry", :quantity => 2, :cost => 14.5])
    expect(order.validate_cost).to be true
  end


end