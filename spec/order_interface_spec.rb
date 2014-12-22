require 'order_interface'

describe OrderInterface do
  
  let(:order_interface){OrderInterface.new}
  let(:menu_manager){MenuManager.new}
  
  context 'validate that dishes are on the menu' do

    it 'should raise an error if an item ordered is not on the menu' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Banana", :quantity => 3, :cost => 30}])
      expect{order_interface.validate_dishes}.to raise_error(RuntimeError, 'Sorry Banana isn\'t on the menu')
    end

  end

  context 'validate that the cost provided by the customer is correct' do

    it 'should raise an error if the total for the ordered items is not correct' do
      allow(order_interface).to receive(:customer_order).and_return([{:dish => "Pad Thai", :quantity => 3, :cost => 30}, {:dish => "Red Curry", :quantity => 2, :cost => 15.5}])
      expect{order_interface.validate_cost}.to raise_error(RuntimeError, 'Sorry the amount you entered is not correct')
    end

  end

  context 'confirming the order' do

    it 'should call the send_confirmation method of TextConfirmation class' do
      text_conf_class_dble = double :text_conf_class_dble
      text_conf_dble = double :text_conf_dble 
      allow(text_conf_class_dble).to receive(:new).and_return(text_conf_dble)
      expect(text_conf_dble).to receive(:send_confirmation)
      order_interface.raise_confirmation_text(text_conf_class_dble)
    end

  end

end