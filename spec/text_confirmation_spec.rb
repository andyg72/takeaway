require 'text_confirmation'

describe TextConfirmation do

  let(:text_confirmation){TextConfirmation.new}

  it 'create a text message for the expected delivery time' do
    expect(text_confirmation.body).not_to be nil
  end

  it 'should generate a text message to Twilio' do
    expect(text_confirmation.construct_text)
  end

end