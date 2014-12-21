require 'order_validation'

describe OrderValidation do
  
let(:order_validation){OrderValidation.new}

it 'if an item ordered is not on the menu an error should be raised' do
  expect{order_vaidation(order_dishes)}.to raise_error(RuntimeError, "The following dishes are not on the menu, please reorder")
end



end