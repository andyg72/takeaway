require 'order_manager'

describe OrderManager do 

  let(:order_manager){OrderManager.new}
  let(:menu_manager){MenuManager.new}
  
  context 'validate that dishes are on the menu' do

    it 'should raise an error if the individual dish ordered is not on the menu' do
      expect{order_manager.validate_dish('Banana')}.to raise_error(RuntimeError, 'Sorry Banana isn\'t on the menu')
    end

  end

  context 'validate that the cost provided by the customer is correct' do

    it 'should raise an error if the total for the dish ordered is incorrect' do
      expect{order_manager.validate_dish_cost('Red Curry', 2, 14.25)}.to raise_error(RuntimeError, 'Sorry the cost you entered is incorrect')
    end

  end

  context 'confirming the order' do

    it 'should call the send_confirmation method of TextConfirmation class' do
      text_conf_class_dble = double :text_conf_class_dble
      text_conf_dble = double :text_conf_dble 
      allow(text_conf_class_dble).to receive(:new).and_return(text_conf_dble)
      expect(text_conf_dble).to receive(:send_confirmation)
      order_manager.raise_confirmation_text(text_conf_class_dble)
    end

  end
  
end