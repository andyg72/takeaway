require 'order_validation'

describe OrderValidation do
  
  let(:order_validation){OrderValidation.new}

  context 'validate that dishes are on the menu' do

    it 'should return false if an item ordered is not on the menu' do
      allow(order_validation).to receive(:customer_order).and_return([{:dish => "Banana", :quantity => 3, :cost => 30}])
      expect(order_validation.validate_dishes).to be false
    end

    it 'should return true if an item ordered is on the menu' do
      allow(order_validation).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}])
      expect(order_validation.validate_dishes).to be true
    end

  end

  context 'validate that the cost provided by the customer is correct' do

    it 'should return false if the total for the ordered items is not correct' do
      allow(order_validation).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}, {:dish => "Red Curry", :quantity => 2, :cost => 15.5}])
      expect(order_validation.validate_cost).to be false
    end
    
    it 'should return true if passed an order where payment is correct' do
      allow(order_validation).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 26.25}, :dish => "Red Curry", :quantity => 2, :cost => 14.5])
      expect(order_validation.validate_cost).to be true
    end

  end

end