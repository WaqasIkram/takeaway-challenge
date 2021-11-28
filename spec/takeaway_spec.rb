require 'takeaway'

describe Takeaway do

# User story 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

subject(:takeaway) { described_class.new(menu: menu) }
let(:menu) { double(:menu, print: printed_menu) }
let(:printed_menu) { "Item: £0.00" }


it 'shows dishes and prices in a menu' do
  expect(takeaway.print_menu).to eq(printed_menu)
end



# User story 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# # User story 3
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# User story 4
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

  

end