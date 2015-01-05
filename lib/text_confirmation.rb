
require 'twilio-ruby'

class TextConfirmation

  ACCOUNT_SID = 'AC14aa4e1c2ecfa3b75d234b1f9e917bbc'
  AUTH_TOKEN = '64b492080ce7062d9142e3b6a1a77e65'
  FROM = '+441490266043'

  attr_reader :body, :client

  def send_confirmation
    create_client
    create_body
    send_text
  end

  def create_client(api = Twilio::REST::Client)
    @client = api.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def create_body
    delivery_time = (Time.new + 60*60).strftime("%R")
    @body = "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end

  def send_text
    client.account.sms.messages.create(
      :from => FROM,
      :to => File.read("phone_number.dat"),
      :body => body)
  end

end