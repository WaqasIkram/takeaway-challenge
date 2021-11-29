require 'order'

describe Order do
  subject(:order) { described_class.new }

  let(:dishes) do
    {
      chicken: 1,
      mix_veg: 2
    }
  end 
  
  it 'picks many dishes from the menu' do
  order.add(:chicken, 1)
  order.add(:mix_veg, 2)
  expect(order.dishes).to eq(dishes)
  end
end