require 'bundler/setup'
require 'twilio-ruby'

# account_sid = AC14aa4e1c2ecfa3b75d234b1f9e917bbc
# auth_token = 64b492080ce7062d9142e3b6a1a77e65

# client = Twilio::REST::Client.new account_sid, auth_token

# client.account.sms.messages.create(
#   :from => '+441490266043'
#   :to => '+447525460227'
#   :body => )


class TextConfirmation

  def create_body
    delivery_time = (Time.new + 60*60).strftime("%R")
    body = "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end

end