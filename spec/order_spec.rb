require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      kebab: 1,
      chips: 1
    }
  end
  
  before do
    allow(menu).to receive(:has_dish?).with(:kebab).and_return(true)
    allow(menu).to receive(:has_dish?).with(:chips).and_return(true)

    allow(menu).to receive(:price).with(:kebab).and_return(5.50)
    allow(menu).to receive(:price).with(:chips).and_return(3.50)
  end
  
  it 'Picks many dishes from the menu' do
  order.add(:kebab, 1)
  order.add(:chips, 1)
  expect(order.dishes).to eq(dishes)
  end

  it "Only allows items to be added, those are on the menu" do
    allow(menu).to receive(:has_dish?).with(:eggs).and_return(false)
    expect { order.add(:eggs, 2).to raise_error NoItemError, "not on the menu :("}
  end

  it "Calculates the total value of the order" do
    order.add(:kebab, 1)
    order.add(:chips, 1)
    total = 9.00
    expect(order.total).to eq(total)
  end


end