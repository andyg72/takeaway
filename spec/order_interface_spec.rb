require 'order_interface'

describe OrderInterface do
  
  let(:order_interface){OrderInterface.new}

  it 'should load the menu' do
    expect(order_interface.menu.length).to be > 0
  end

  it 'should create a list of dishes' do
    expect(order_interface.menu_dishes.length).to be > 0
  end

  it 'should create a customer order (provided details are correct)' do
    expect(order_interface.customer_order.length).to be > 0
  end

  context 'validate that dishes are on the menu' do

    it 'should return false if an item ordered is not on the menu' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Banana", :quantity => 3, :cost => 30}])
      expect(order_interface.validate_dishes).to be false
    end

    it 'should return true if an item ordered is on the menu' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}])
      expect(order_interface.validate_dishes).to be true
    end

  end

  context 'validate that the cost provided by the customer is correct' do

    it 'should return false if the total for the ordered items is not correct' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}, {:dish => "Red Curry", :quantity => 2, :cost => 15.5}])
      expect(order_interface.validate_cost).to be false
    end
    
    it 'should return true if passed an order where payment is correct' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 26.25}, :dish => "Red Curry", :quantity => 2, :cost => 14.5])
      expect(order_interface.validate_cost).to be true
    end

  end


end