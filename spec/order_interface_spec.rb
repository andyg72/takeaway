require 'order_interface'

describe OrderInterface do
  
  let(:order_interface){OrderInterface.new}

  it 'should create a customer order (provided details are correct)' do
    expect(order_interface.customer_order.length).to be > 0
  end


end