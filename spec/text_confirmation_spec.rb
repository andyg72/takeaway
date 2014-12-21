require 'text_confirmation'

describe TextConfirmation do

  let(:text_confirmation){TextConfirmation.new}

  it 'create a text message for the expected delivery time' do
    expect(text_confirmation.create_body).not_to be nil
  end


  
end