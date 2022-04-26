require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 9.00) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Kebab: £5.50" }
  
  let(:dishes) { {kebab: 2, chips: 4} }

  before do
    allow(order).to receive(:add)
  end
  
  it 'shows dishes and prices in a menu.' do
  expect(takeaway.printed_menu).to eq(printed_menu)
  end

  it "allows you to order available dishes multiple times." do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "Knows the total sum" do
    total = takeaway.place_order(dishes)
    expect(total).to eq(9.00) 
  end

  it "Sends texts to confirm the orders" do
    expect(sms).to receive(:deliver) 
    takeaway.place_order(dishes)
  end
end