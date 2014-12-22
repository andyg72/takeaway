require 'text_confirmation'

describe TextConfirmation do
  
  let(:text_confirmation){TextConfirmation.new}
  let(:api_double){double :api_double}
 

  it 'should create a text message for the expected delivery time' do
    text_confirmation.create_body
    expect(text_confirmation.body.length).to eq(68)
  end

  it 'should create a client link with Twilio' do
    expect(api_double).to receive(:new).with('AC14aa4e1c2ecfa3b75d234b1f9e917bbc','64b492080ce7062d9142e3b6a1a77e65')
    text_confirmation.create_client(api_double)
  end

end