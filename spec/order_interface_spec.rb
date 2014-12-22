require 'order_interface'

describe OrderInterface do
  
  let(:order_interface){OrderInterface.new}
  let(:menu_manager){MenuManager.new}
  
  context 'validate that dishes are on the menu' do

    it 'should return false if an item ordered is not on the menu' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Banana", :quantity => 3, :cost => 30}])
      expect{order_interface.validate_dishes}.to raise_error(RuntimeError, 'Sorry at least one item you ordered isn\'t on the menu')
    end

    it 'should return true if an item ordered is on the menu' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}])
      expect(order_interface.validate_dishes).to be nil
    end

  end

  context 'validate that the cost provided by the customer is correct' do

    it 'should return false if the total for the ordered items is not correct' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}, {:dish => "Red Curry", :quantity => 2, :cost => 15.5}])
      expect{order_interface.validate_cost}.to raise_error(RuntimeError, 'Sorry the amount you entered is not correct')
    end
    
    it 'should return true if passed an order where payment is correct' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 26.25}, :dish => "Red Curry", :quantity => 2, :cost => 14.5])
      expect(order_interface.validate_cost).to be nil
    end

  end


end