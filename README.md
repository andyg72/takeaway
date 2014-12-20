#takeaway
========

##Makers Academy Weekend Challenge - Week 2 Pt2

###Coding Objective: Write a Takeaway program.
###Learning Objective: Ruby, Object Oriented Design, Test Driven Development, Twilio API integration through gem

Implement the following functionality:
- list of dishes with prices
- placing the order by giving the list of dishes, their quantities and a number that should be the exact total. 
  - If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
- The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  - Use twilio-ruby gem to access the API
  - Use a Gemfile to manage your gems
Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

Note: We are looking for good OO design and programming! Remember the SOLID principles!

##Class Responsibility Collaborators - Domain Model

###Menu
| Responsibility | Collaborators|
|----------------|--------------|
| display Menu   | Order Interface |

###Order Validation
| Responsibility | Collaborators|
|----------------|--------------|
| validate Order | Order Interface |

###Customer
| Responsibility | Collaborators|
|----------------|--------------|
| provide Customer Details | Order Interface |

###Confirm Order
| Responsibility | Collaborators|
|----------------|--------------|
| text Customer  | Order Interface |

###Order Interface
| Responsibility | Collaborators|
|----------------|--------------|
| display Menu   | Menu |
| take Order     | |
| validate Order | Order Validation |
| provider Customer Details | Customer |
| text Customer | Confirm Order







