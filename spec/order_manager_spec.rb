require 'order_manager'

describe OrderManager do 

  let(:order_manager){OrderManager.new}
  let(:menu_manager){MenuManager.new}
  
    it 'should add a legitimate item to the order' do
      allow(order_manager).to receive(:validate_dish).with('Banana').and_return(true)
      allow(order_manager).to receive(:validate_dish_cost).with('Banana', 3, 0.99).and_return(true)
      order_manager.add_item_to_order('Banana', 3, 0.99)
      expect(order_manager.customer_order).to eq([{:dish=>"Banana", :quantity=>3, :cost=>0.99}])
    end

    it 'should raise an error if the individual dish ordered is not on the menu' do
      expect{order_manager.validate_dish('Banana')}.to raise_error(RuntimeError, 'Sorry Banana isn\'t on the menu')
    end

    it 'should raise an error if the total for the dish ordered is incorrect' do
      expect{order_manager.validate_dish_cost('Red Curry', 2, 14.25)}.to raise_error(RuntimeError, 'Sorry the cost you entered is incorrect')
    end

    it 'should delete an item from the order when requested' do
      allow(order_manager).to receive(:validate_dish).with('Banana').and_return(true)
      allow(order_manager).to receive(:validate_dish_cost).with('Banana', 3, 0.99).and_return(true)
      order_manager.add_item_to_order('Banana', 3, 0.99)
      expect(order_manager.customer_order).to eq([{:dish=>"Banana", :quantity=>3, :cost=>0.99}])
      order_manager.delete_item(0)
      expect(order_manager.customer_order).to eq([])
    end

    it 'should call the send_confirmation method of TextConfirmation class' do
      text_conf_class_dble = double :text_conf_class_dble
      text_conf_dble = double :text_conf_dble 
      allow(text_conf_class_dble).to receive(:new).and_return(text_conf_dble)
      expect(text_conf_dble).to receive(:send_confirmation)
      order_manager.raise_confirmation_text(text_conf_class_dble)
    end
  
end